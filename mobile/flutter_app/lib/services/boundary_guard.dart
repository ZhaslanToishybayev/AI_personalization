class BoundaryRule {
  BoundaryRule({
    required this.id,
    required this.description,
    required this.isCritical,
    required this.matcher,
  });

  final String id;
  final String description;
  final bool isCritical;
  final bool Function(String topic, DateTime timestamp) matcher;
}

class BoundaryDecision {
  BoundaryDecision({
    required this.allowed,
    required this.reason,
    required this.overridden,
  });

  final bool allowed;
  final String reason;
  final bool overridden;
}

class BoundaryGuard {
  BoundaryGuard({required this.rules});

  final List<BoundaryRule> rules;

  BoundaryDecision evaluate({
    required String topic,
    required DateTime timestamp,
    bool quietHoursOverride = false,
  }) {
    for (final rule in rules) {
      final matches = rule.matcher(topic, timestamp);
      if (!matches) {
        continue;
      }
      if (quietHoursOverride && rule.isCritical) {
        return BoundaryDecision(
          allowed: true,
          reason: 'Override applied for rule ${rule.id}',
          overridden: true,
        );
      }
      return BoundaryDecision(
        allowed: false,
        reason: 'Blocked by rule ${rule.id}: ${rule.description}',
        overridden: false,
      );
    }

    return BoundaryDecision(
      allowed: true,
      reason: 'No boundary rules matched',
      overridden: false,
    );
  }
}
