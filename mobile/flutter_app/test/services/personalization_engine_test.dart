import 'package:drift/native.dart';
import 'package:flutter_app/data/local/local_store.dart';
import 'package:flutter_app/domain/assistive_suggestion.dart';
import 'package:flutter_app/domain/context_signal.dart';
import 'package:flutter_app/services/personalization_engine.dart';
import 'package:flutter_test/flutter_test.dart';

class _FakeLocalStore extends LocalStore {
  _FakeLocalStore() : super.forTesting(NativeDatabase.memory());

  @override
  Future<List<ContextSignal>> activeContextSignals(String userId) async => [];

  @override
  Future<void> upsertSuggestions(List<AssistiveSuggestion> suggestions) async {}
}

void main() {
  group('PersonalizationEngine confidence band', () {
    test('maps numeric confidence to labeled band', () {
      final engine = PersonalizationEngine(localStore: _FakeLocalStore());

      expect(engine.confidenceBandFor(0.92), equals('very_high'));
      expect(engine.confidenceBandFor(0.66), equals('high'));
      expect(engine.confidenceBandFor(0.48), equals('medium'));
      expect(engine.confidenceBandFor(0.21), equals('low'));
      expect(engine.confidenceBandFor(0.05), equals('very_low'));
    });
  });
}
