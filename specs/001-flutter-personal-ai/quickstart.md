# Quickstart — Personal AI Assistant Mobile App

## 1. Prerequisites
- Flutter 3.x (stable) with Dart 3.5 (`flutter doctor` clean)
- Android Studio / Xcode with emulators configured
- Firebase project (dev) with Authentication + Firestore enabled
- Access credentials for AI middleware (Vertex AI endpoint + OAuth client)
- Google Cloud OAuth credentials for Calendar/Gmail integration (dev scopes)
- Node.js 20.x + pnpm (for mock middleware server)

## 2. Environment Setup
1. `git checkout 001-flutter-personal-ai`
2. Install Flutter dependencies:
   ```bash
   cd mobile/flutter_app
   flutter pub get
   ```
3. Configure Firebase:
   - Place `google-services.json` (Android) in `android/app/`.
   - Place `GoogleService-Info.plist` (iOS) in `ios/Runner/`.
4. Copy `.env.example` to `.env` and populate credentials (loaded via `flutter_dotenv`):
   - `VERTEX_AI_ENDPOINT`
   - `VERTEX_AI_PROJECT_ID`
   - `FIREBASE_API_KEY`
   - `FIREBASE_PROJECT_ID`
   - `GOOGLE_OAUTH_CLIENT_ID`
   - `GOOGLE_OAUTH_CLIENT_SECRET`
   - `MOCK_API_BASE_URL`
   - `SERVICE_AUTH_TOKEN`
5. Run code generation if using `freezed`/`json_serializable`:
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```
6. Bootstrap mock middleware server (contract parity with Vertex AI):
   ```bash
   cd ../../api/mock-server
   pnpm install
   pnpm run dev
   ```
   The dev server listens on `http://localhost:8787` and serves `/assistant/*`, `/context/*`, and `/notifications/*` routes defined in OpenAPI contracts.
7. Review `lib/core/config/app_config.dart` to confirm environment variables align with your infrastructure.

## 3. Running the App
```bash
flutter run -d <device_id>
```
- Use staging environment; mock AI responses if middleware unavailable.

## 4. Running Tests
- Unit tests: `flutter test`
- Contract tests: `dart test test/contracts` (requires mock server running)
- Golden tests: `flutter test --update-goldens` (after approved UI changes)
- Integration tests: `flutter test integration_test`

## 5. Demo Script
1. Launch app; complete onboarding with sample work hours and consent.
2. Connect Google Calendar (use sandbox account).
3. Ask assistant via text: "Summarize my morning." Observe schedule summary.
4. Trigger voice input (push-to-talk) and request "Plan my afternoon with focus time." Verify suggestions.
5. Decline one suggestion; open "Insights" screen to confirm feedback captured.
6. Enable quiet hours; send conflicting event; confirm critical alert respects boundary while offering overrides.

## 6. Troubleshooting
- If AI calls fail, check mock server logs under `api/mock-server/` and ensure `MOCK_API_BASE_URL` is reachable.
- For permission issues, reset app permissions on device/emulator.
- When tests hang on integration flows, ensure test environment has seeded mock data via `pnpm run seed` (script to be added with contract fixtures).
- For localization discrepancies, run `flutter gen-l10n --arb-dir=lib/l10n/arb` and verify missing translation warnings in CI.
