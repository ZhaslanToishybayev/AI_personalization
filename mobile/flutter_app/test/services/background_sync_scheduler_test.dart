import 'package:flutter_test/flutter_test.dart';
import 'package:workmanager/workmanager.dart';

import 'package:flutter_app/services/background_sync_scheduler.dart';

void main() {
  late _FakeWorkManager fake;
  late BackgroundSyncScheduler scheduler;

  setUp(() {
    fake = _FakeWorkManager();
    scheduler = BackgroundSyncScheduler(workManager: fake);
  });

  tearDown(() {
    BackgroundSyncCallbacks.register((_, __) async => true);
  });

  test('ensureInitialized delegates to workmanager once', () async {
    await scheduler.ensureInitialized(debug: true);
    await scheduler.ensureInitialized();

    expect(fake.initializeCount, 1);
    expect(fake.lastDebugFlag, true);
  });

  test('scheduleRecurringSync enforces minimum frequency', () async {
    expect(
      () => scheduler.scheduleRecurringSync(
        frequency: const Duration(minutes: 1),
      ),
      throwsArgumentError,
    );
  });

  test('scheduleRecurringSync registers periodic task with defaults', () async {
    await scheduler.scheduleRecurringSync();

    expect(fake.periodicTasks.length, 1);
    final task = fake.periodicTasks.first;
    expect(task.uniqueName, 'context-sync-recurring');
    expect(task.taskName, BackgroundSyncScheduler.taskName);
    expect(task.frequency, const Duration(hours: 6));
    expect(task.initialDelay, const Duration(minutes: 5));
    expect(task.policy, ExistingWorkPolicy.replace);
    expect(task.constraints?.networkType, NetworkType.connected);
  });

  test('triggerImmediateSync registers one-off task', () async {
    await scheduler.triggerImmediateSync(delay: const Duration(minutes: 2));

    expect(fake.oneOffTasks.length, 1);
    final task = fake.oneOffTasks.first;
    expect(task.taskName, BackgroundSyncScheduler.taskName);
    expect(task.initialDelay, const Duration(minutes: 2));
    expect(task.policy, ExistingWorkPolicy.replace);
    expect(task.constraints?.networkType, NetworkType.connected);
    expect(task.uniqueName.startsWith('context-sync-oneoff'), isTrue);
  });

  test('cancelRecurringSync delegates to workmanager', () async {
    await scheduler.cancelRecurringSync();
    expect(fake.canceledUniqueNames, contains('context-sync-recurring'));
  });

  test('registerHandler forwards handler to callbacks', () async {
    var invoked = false;
    scheduler.registerHandler((task, _) async {
      invoked = task == BackgroundSyncScheduler.taskName;
      return true;
    });

    final result = await BackgroundSyncCallbacks.invoke(
      BackgroundSyncScheduler.taskName,
      null,
    );
    expect(result, isTrue);
    expect(invoked, isTrue);
  });
}

class _FakeWorkManager implements WorkManagerClient {
  int initializeCount = 0;
  bool? lastDebugFlag;
  final List<_PeriodicInvocation> periodicTasks = [];
  final List<_OneOffInvocation> oneOffTasks = [];
  final List<String> canceledUniqueNames = [];

  @override
  Future<void> cancelByUniqueName(String uniqueName) async {
    canceledUniqueNames.add(uniqueName);
  }

  @override
  Future<void> initialize(
    void Function() dispatcher, {
    bool isInDebugMode = false,
  }) async {
    initializeCount++;
    lastDebugFlag = isInDebugMode;
  }

  @override
  Future<void> registerOneOffTask(
    String uniqueName,
    String taskName, {
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy = ExistingWorkPolicy.replace,
    Constraints? constraints,
  }) async {
    oneOffTasks.add(
      _OneOffInvocation(
        uniqueName: uniqueName,
        taskName: taskName,
        initialDelay: initialDelay,
        policy: policy,
        constraints: constraints,
      ),
    );
  }

  @override
  Future<void> registerPeriodicTask(
    String uniqueName,
    String taskName, {
    required Duration frequency,
    Duration initialDelay = Duration.zero,
    ExistingWorkPolicy policy = ExistingWorkPolicy.replace,
    Constraints? constraints,
  }) async {
    periodicTasks.add(
      _PeriodicInvocation(
        uniqueName: uniqueName,
        taskName: taskName,
        frequency: frequency,
        initialDelay: initialDelay,
        policy: policy,
        constraints: constraints,
      ),
    );
  }
}

class _PeriodicInvocation {
  _PeriodicInvocation({
    required this.uniqueName,
    required this.taskName,
    required this.frequency,
    this.initialDelay = Duration.zero,
    this.policy,
    this.constraints,
  });

  final String uniqueName;
  final String taskName;
  final Duration frequency;
  final Duration initialDelay;
  final ExistingWorkPolicy? policy;
  final Constraints? constraints;
}

class _OneOffInvocation {
  _OneOffInvocation({
    required this.uniqueName,
    required this.taskName,
    this.initialDelay = Duration.zero,
    this.policy,
    this.constraints,
  });

  final String uniqueName;
  final String taskName;
  final Duration initialDelay;
  final ExistingWorkPolicy? policy;
  final Constraints? constraints;
}
