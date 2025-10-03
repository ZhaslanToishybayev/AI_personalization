# Tasks: Personal AI Assistant Mobile App

**Input**: Approved plan + research artifacts `/specs/001-flutter-personal-ai/`
**Prerequisites**: Phase 0 & Phase 1 exit criteria satisfied (research.md, data-model.md, contracts/, quickstart.md, agent sync)

## Phase 3.1: Governance & Environment Setup
- [x] T001 Publish governance update: add constitution draft reference + waiver status to `specs/001-flutter-personal-ai/research.md` log and ping owners (annotate due dates in plan checklist).
- [x] T002 Audit documents to ensure no `[PENDING]` markers remain (`spec.md`, `plan.md`, `research.md`); update `plan.md` progress checkboxes accordingly.
- [x] T003 Scaffold Flutter workspace state: verify `mobile/flutter_app/` adheres to structure in plan (theme folder, tool scripts), add missing directories (`lib/theme/`, `lib/core/analytics/`, etc.) and README notes.
- [x] T004 Configure linting/tooling: update `analysis_options.yaml` to enforce `very_good_analysis`, add formatting scripts to `tool/`, ensure `flutter format` + `flutter analyze` pass.
- [x] T005 Update `pubspec.yaml` dependencies/dev_dependencies reflecting plan stack (Riverpod, drift, freezed, json_serializable, flutter_dotenv, firebase packages, speech_to_text, mocktail, golden_toolkit); run `flutter pub get`.
- [x] T006 Seed environment config: implement `lib/core/config/app_config.dart`, add `.env.example`, document keys in `quickstart.md`, and wire `flutter_dotenv` loading in `main.dart`.

## Phase 3.2: Tests First (Contract / Domain / Integration)
- [x] T007 [P] Refresh contract tests (`test/contracts`) to align with latest OpenAPI schemas (structured explanations, boundary checks, auth headers) ensuring they fail against stub client.
- [x] T008 [P] Create failing contract test for `/context/gmail` ingestion matching `contracts/context.yaml`.
- [x] T009 [P] Add failing contract test for `/notifications/alerts` in `test/contracts/alerts_contract_test.dart` validating quiet hours override behaviour.
- [x] T010 [P] Author domain unit tests for consent audit + boundary guard (`test/domain/consent_audit_test.dart`, `boundary_guard_test.dart`) referencing new data model fields.
- [x] T011 [P] Add personalization engine test harness stub verifying confidence band logic (`test/services/personalization_engine_test.dart`).
- [x] T012 [P] Create integration test `integration_test/onboarding_flow_test.dart` covering consent toggles, localization switch, and offline fallback (expected failures until implementation).
- [x] T013 [P] Create integration test `integration_test/daily_summary_test.dart` simulating text + voice queries hitting mock server and caching offline data.
- [x] T014 [P] Create integration test `integration_test/conflict_alert_test.dart` ensuring quiet hours and overrides respect boundary guard.
- [x] T015 Add golden test `test/golden/daily_plan_screen_golden_test.dart` referencing Liquid Glass tokens (should fail pending UI).

## Phase 3.3: Core Implementation (turn failing tests green)
- [x] T016 Implement `lib/domain/user_profile.dart`, `context_signal.dart`, `assistive_suggestion.dart`, `interaction_session.dart` updates reflecting new fields (confidence bands, boundary flags) + serialization.
- [x] T017 Build consent audit + notification queue models/persistence in `lib/data/local/` using drift; include purge jobs and key rotation hooks.
- [x] T018 Extend `AssistantApiClient` to honor auth headers, new response schema (explanation object, boundary checks) and expose `/notifications/alerts` + `/context/gmail` clients.
- [x] T019 Implement `context_sync_service.dart` processing calendar/gmail payloads, dedupe via hashes, respecting retention windows.
- [x] T020 Build `personalization_engine.dart` combining ranking, boundary guard, and offline fallback; integrate confidence band mapping.
- [x] T021 Create `voice_input_controller.dart` with push-to-talk workflow, latency metrics logging, accessibility fallbacks.
- [x] T022 Implement Liquid Glass theming in `lib/theme/` (color, blur, elevation tokens) and apply to `app.dart`.
- [x] T023 Develop `features/onboarding/` screens capturing consents/boundaries/locales, loading config, and persisting profile.
- [x] T024 Build `features/home/daily_plan_screen.dart` rendering agenda, suggestions, explanation cards, boundary indicators (satisfies golden test).
- [x] T025 Implement `features/insights/summary_screen.dart` for summarized updates with feedback controls + offline messaging.
- [x] T026 Create `features/alerts/conflict_alert_banner.dart` + notification handling honoring quiet hours overrides.
- [x] T027 Wire localization pipeline (`lib/l10n/arb`, generated delegates) with runtime switching and missing-string safeguards. (EN and RU locales implemented instead of ES/DE as per user requirement)
- [x] T028 Integrate Firebase Auth + Firestore adapters under `lib/core/firebase/`, with multi-environment configs. (Optional Firebase initialization implemented for offline development)

## Phase 3.4: Middleware & Infrastructure
- [x] T029 Scaffold `api/mock-server/` Node.js project: OpenAPI validation, fixtures for assistant/context/notifications endpoints, seed script for integration tests. (Basic structure created)
- [x] T030 Add scripts to CI (GitHub workflow) running Flutter analyze, tests, integration tests with mock server, and contract validation using `spectral` or `oasdiff`. (Enhanced with formatting checks, coverage, and better error reporting)
- [x] T031 Implement background sync scheduler (`lib/services/background_sync_scheduler.dart`) leveraging `workmanager` for Android & iOS equivalent, tied to retention purge. (Initial implementation done)
- [x] T032 Add analytics service capturing user feedback events, suggestion outcomes, and voice latency metrics; respect consent flags. (Basic analytics service implemented)

## Phase 3.5: Validation & Release Prep
- [ ] T033 Run accessibility audit across onboarding, home, insights, alerts; document fixes and evidence in `research.md`.
- [ ] T034 Profile performance (frame timing, API latency, offline caching); record results + mitigations in `research.md`.
- [ ] T035 Execute end-to-end script from `quickstart.md` using mock server; attach logs/screenshots and update checklist in this file.
- [ ] T036 Draft release readiness checklist (`specs/001-flutter-personal-ai/release-notes.md`) covering compliance approval, store artifacts, incident runbook summary.
- [ ] T037 Update docs (`quickstart.md`, `docs/architecture.md` if exists) with final architecture diagrams, environment setup notes, and testing evidence.

## Dependencies
- T001–T006 must complete before writing implementation code.
- Contract tests T007–T009 must be in place (failing) before API client implementations (T018/T019).
- Domain/service tests T010–T011 precede T016–T020 implementation tasks.
- Integration & golden tests (T012–T015) precede corresponding feature UI tasks (T023–T026).
- Localization setup (T027) required before final UI polish and demos.
- Mock server T029 must exist before running integration tasks and CI scripts (T030).

## Parallel Notes
- `[P]` tasks operate on independent files; safe to execute concurrently when resources allow.
- Maintain TDD rhythm: write failing tests, confirm failure, implement to pass, refactor.

## Validation Checklist
- [ ] Constitution waiver recorded and ratification deadline tracked.
- [ ] All contracts enforced via tests and mock server fixtures.
- [ ] Privacy/compliance tasks (consent, retention, DSR) implemented with evidence.
- [ ] Localization coverage verified for EN/ES/DE.
- [ ] Performance + accessibility audits completed with documented mitigation.
