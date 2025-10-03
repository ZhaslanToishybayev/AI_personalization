import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:workmanager/workmanager.dart';

typedef BackgroundTaskHandler =
    Future<bool> Function(String taskName, Map<String, dynamic>? inputData);

const String _recurringUniqueName = 'context-sync-recurring';
const String _oneOffPrefix = 'context-sync-oneoff';

/// Exposes a shared handler registry so the background isolate can invoke
/// feature-specific logic while remaining testable.
class BackgroundSyncCallbacks {
  BackgroundSyncCallbacks._();

  static BackgroundTaskHandler _handler = _noop;

  static void register(BackgroundTaskHandler handler) {
    _handler = handler;
  }

  static Future<bool> invoke(String taskName, Map<String, dynamic>? inputData) {
    return _handler(taskName, inputData);
  }

  static Future<bool> _noop(
    String taskName,
    Map<String, dynamic>? inputData,
  ) async {
    return true;
  }
}

/// Top-level callback required by [workmanager] to execute background tasks.
void backgroundSyncCallbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    return BackgroundSyncCallbacks.invoke(taskName, inputData);
  });
}

abstract class WorkManagerClient {
  Future<void> initialize(
    void Function() dispatcher, {
    bool isInDebugMode = false,
  });

  Future<void> registerPeriodicTask(
    String uniqueName,
    String taskName, {
    required Duration frequency,
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy,
    Constraints? constraints,
  });

  Future<void> registerOneOffTask(
    String uniqueName,
    String taskName, {
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy,
    Constraints? constraints,
  });

  Future<void> cancelByUniqueName(String uniqueName);
}

class PluginWorkManagerClient implements WorkManagerClient {
  PluginWorkManagerClient(this._workmanager);

  final Workmanager _workmanager;

  @override
  Future<void> initialize(
    void Function() dispatcher, {
    bool isInDebugMode = false,
  }) {
    return _workmanager.initialize(dispatcher, isInDebugMode: isInDebugMode);
  }

  @override
  Future<void> registerPeriodicTask(
    String uniqueName,
    String taskName, {
    required Duration frequency,
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy = ExistingWorkPolicy.replace,
    Constraints? constraints,
  }) {
    return _workmanager.registerPeriodicTask(
      uniqueName,
      taskName,
      frequency: frequency,
      initialDelay: initialDelay,
      existingWorkPolicy: policy,
      constraints: constraints,
    );
  }

  @override
  Future<void> registerOneOffTask(
    String uniqueName,
    String taskName, {
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy = ExistingWorkPolicy.replace,
    Constraints? constraints,
  }) {
    return _workmanager.registerOneOffTask(
      uniqueName,
      taskName,
      initialDelay: initialDelay,
      existingWorkPolicy: policy,
      constraints: constraints,
    );
  }

  @override
  Future<void> cancelByUniqueName(String uniqueName) {
    return _workmanager.cancelByUniqueName(uniqueName);
  }
}

final backgroundSyncSchedulerProvider = Provider<BackgroundSyncScheduler>((
  ref,
) {
  return BackgroundSyncScheduler(
    workManager: PluginWorkManagerClient(Workmanager()),
  );
});

class BackgroundSyncScheduler {
  BackgroundSyncScheduler({
    required WorkManagerClient workManager,
    Duration minimumFrequency = const Duration(minutes: 15),
  }) : _workManager = workManager,
       _minimumFrequency = minimumFrequency;

  static const String taskName = 'context-sync-task';

  final WorkManagerClient _workManager;
  final Duration _minimumFrequency;
  bool _initialized = false;

  Future<void> ensureInitialized({bool debug = false}) async {
    if (_initialized) return;
    await _workManager.initialize(
      backgroundSyncCallbackDispatcher,
      isInDebugMode: debug,
    );
    _initialized = true;
  }

  Future<void> scheduleRecurringSync({
    Duration frequency = const Duration(hours: 6),
    Duration initialDelay = const Duration(minutes: 5),
    bool debug = false,
  }) async {
    if (frequency < _minimumFrequency) {
      throw ArgumentError.value(
        frequency,
        'frequency',
        'must be at least $_minimumFrequency',
      );
    }

    await ensureInitialized(debug: debug);
    await _workManager.registerPeriodicTask(
      _recurringUniqueName,
      taskName,
      frequency: frequency,
      initialDelay: initialDelay,
      policy: ExistingWorkPolicy.replace,
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }

  Future<void> triggerImmediateSync({Duration? delay}) async {
    await ensureInitialized();
    final uniqueName =
        '$_oneOffPrefix-${DateTime.now().millisecondsSinceEpoch}';
    await _workManager.registerOneOffTask(
      uniqueName,
      taskName,
      initialDelay: delay ?? Duration.zero,
      policy: ExistingWorkPolicy.replace,
      constraints: Constraints(networkType: NetworkType.connected),
    );
  }

  Future<void> cancelRecurringSync() {
    return _workManager.cancelByUniqueName(_recurringUniqueName);
  }

  void registerHandler(BackgroundTaskHandler handler) {
    BackgroundSyncCallbacks.register(handler);
  }
}
