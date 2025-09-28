import 'package:flutter/material.dart';
import 'package:flutter_app/features/alerts/conflict_alert_banner.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('renders conflict details and alternatives', (tester) async {
    var selected = '';
    var dismissed = false;

    final viewModel = ConflictAlertViewModel(
      title: 'Quiet hours active',
      description: "Sending summary now would break Casey's quiet hours.",
      contextNote: 'Quiet hours end at 07:00 in America/Los_Angeles.',
      alternatives: [
        ConflictAlternative(
          label: 'Schedule after 07:00',
          icon: Icons.schedule,
          onSelected: () => selected = 'schedule',
        ),
        ConflictAlternative(
          label: 'Send anyway',
          icon: Icons.send,
          onSelected: () => selected = 'send',
        ),
      ],
      onDismissed: () => dismissed = true,
    );

    await tester.pumpWidget(
      MaterialApp(
        theme: GlassTheme.light(),
        home: Scaffold(body: ConflictAlertBanner(viewModel: viewModel)),
      ),
    );

    expect(find.text('Quiet hours active'), findsOneWidget);
    expect(
      find.text("Sending summary now would break Casey's quiet hours."),
      findsOneWidget,
    );
    expect(
      find.text('Quiet hours end at 07:00 in America/Los_Angeles.'),
      findsOneWidget,
    );

    await tester.tap(find.text('Schedule after 07:00'));
    await tester.pump();
    expect(selected, 'schedule');

    await tester.tap(find.text('Dismiss'));
    await tester.pump();
    expect(dismissed, isTrue);
  });
}
