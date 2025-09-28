import 'package:flutter_app/services/boundary_guard.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BoundaryGuard', () {
    test('blocks topics flagged by quiet hours rule unless overridden', () {
      final guard = BoundaryGuard(
        rules: [
          BoundaryRule(
            id: 'quiet-hours',
            description: 'Respect quiet hours between 22:00 and 07:00',
            isCritical: true,
            matcher: (topic, timestamp) {
              final hour = timestamp.toUtc().hour;
              return hour >= 22 || hour < 7;
            },
          ),
        ],
      );

      final decision = guard.evaluate(
        topic: 'calendar.alert',
        timestamp: DateTime.utc(2025, 9, 27, 23, 30),
      );

      expect(decision.allowed, isFalse);
      expect(decision.overridden, isFalse);
      expect(decision.reason, contains('quiet hours'));

      final overrideDecision = guard.evaluate(
        topic: 'calendar.alert',
        timestamp: DateTime.utc(2025, 9, 27, 23, 30),
        quietHoursOverride: true,
      );

      expect(overrideDecision.allowed, isTrue);
      expect(overrideDecision.overridden, isTrue);
    });
  });
}
