import 'package:flutter/material.dart';
import 'package:flutter_app/theme/widgets/simple_card.dart';

/// Simple Material Design Home Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal AI'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            tooltip: 'Notifications',
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 16),
        children: [
          // Greeting Card
          SimpleCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.wb_sunny_outlined,
                        color: theme.colorScheme.primary,
                        size: 28,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good morning',
                            style: textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Let\'s make today productive',
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Section: Today's Agenda
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Today\'s Agenda',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          // Agenda Items
          SimpleCard(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '9:00 AM - Team Meeting',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Conference Room A',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'More options',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Container(
                  width: 4,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '2:00 PM - Client Call',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Video Conference',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_vert),
                  tooltip: 'More options',
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // Section: Suggestions
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  size: 20,
                  color: theme.colorScheme.secondary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Suggestions',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: theme.colorScheme.secondary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Icon(
                    Icons.flight_takeoff,
                    color: theme.colorScheme.secondary,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Book Flight',
                        style: textTheme.titleSmall,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Flight UA 455 available',
                        style: textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('View'),
                ),
              ],
            ),
          ),

          // Section: Focus Tasks
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
            child: Row(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Focus Tasks',
                  style: textTheme.titleMedium,
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Semantics(
                  label: 'Mark "Review Q4 Report" as complete',
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: Text(
                    'Review Q4 Report',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),

          SimpleCard(
            child: Row(
              children: [
                Semantics(
                  label: 'Mark "Update Project Timeline" as complete',
                  child: Checkbox(
                    value: false,
                    onChanged: (value) {},
                  ),
                ),
                Expanded(
                  child: Text(
                    'Update Project Timeline',
                    style: textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
