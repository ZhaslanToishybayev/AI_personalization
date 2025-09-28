import 'package:flutter/material.dart';
import 'package:flutter_app/features/insights/summary_screen.dart';
import 'package:flutter_app/l10n/app_localizations.dart';
import 'package:flutter_app/theme/liquid_glass_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Assistant surfaces updates with explanations and offline prompts',
    (tester) async {
      var voiceTapCount = 0;
      final viewModel = SummaryViewModel(
        headerTitle: 'Summary',
        summaryHeading: 'Key updates since last check-in',
        highlights: const [
          HighlightModel(
            title: 'Project Phoenix',
            description: 'Design review rescheduled to Friday 10:00.',
            accent: Colors.blueAccent,
            confidenceLabel: 'high',
            sources: [
              HighlightSourceModel(
                signalId: 'signal-123',
                summary: 'Calendar conflict discovered',
              ),
            ],
          ),
        ],
        followUps: const ['Send revised roadmap to leadership.'],
        signals: const ['3 urgent emails flagged overnight.'],
        onVoiceTap: () => voiceTapCount++,
      );

      await tester.pumpWidget(
        ProviderScope(
          child: MaterialApp(
            locale: const Locale('en'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: GlassTheme.light(),
            home: SummaryScreen(viewModel: viewModel),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Summary'), findsOneWidget);
      expect(find.text('Key updates since last check-in'), findsOneWidget);

      // Expect explanation chip and source metadata per contract
      expect(find.text('Confidence: high'), findsOneWidget);
      expect(find.text('Sources (1)'), findsOneWidget);
      await tester.tap(find.text('View sources'));
      await tester.pumpAndSettle();
      expect(find.textContaining('signal-123'), findsOneWidget);

      await tester.tap(find.byIcon(Icons.mic));
      await tester.pumpAndSettle();
      expect(voiceTapCount, equals(1));

      // Offline fallback banner should render when mock server unavailable
      expect(find.text('Offline summary cached'), findsOneWidget);
    },
  );
}
