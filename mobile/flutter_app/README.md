# Personal AI Assistant — Flutter Client

This Flutter workspace hosts the mobile client for the Personal AI Assistant MVP. It aligns with the feature plan in `specs/001-flutter-personal-ai/` and pairs with the Cloud Run middleware + mock server defined in `api/mock-server/`.

## Structure
```
lib/
├── app.dart                # App root & routing (TBD)
├── core/                   # Cross-cutting concerns (config, firebase, analytics)
├── data/                   # API + local persistence layers
├── domain/                 # Immutable models & business logic
├── features/               # UI flows (onboarding, home, insights, alerts, voice)
├── services/               # Orchestrators (personalization, notifications, background)
└── theme/                  # Liquid Glass design tokens & theming helpers
```

Tests live under `test/` (unit, contract, golden) and `integration_test/` for end-to-end flows.

## Getting Started
Follow the Quickstart at `specs/001-flutter-personal-ai/quickstart.md` to configure Flutter, Firebase, environment variables, and the mock middleware server.

Common commands:
- `flutter pub get`
- `flutter analyze`
- `flutter test`
- `dart test test/contracts`
- `flutter test integration_test`

## Tooling Notes
- Linting enforces `very_good_analysis` rules (see `analysis_options.yaml`).
- Formatting uses `flutter format .`.
- Environment variables load via `lib/core/config/app_config.dart` and `flutter_dotenv`.

Refer to the implementation plan for task sequencing and compliance checkpoints.
