# Implementation Plan: Personal AI Assistant Mobile App

**Branch**: `[001-flutter-personal-ai]` | **Date**: 2025-09-27 | **Spec**: `/specs/001-flutter-personal-ai/spec.md`
**Input**: Feature specification from `/specs/001-flutter-personal-ai/spec.md`

## Summary
Deliver an MVP Flutter mobile experience where a personal AI assistant curates daily plans, summarizes high-signal updates, and issues proactive nudges inside the Liquid Glass interface. Implementation pairs a Flutter client with a mockable AI orchestration layer, codifies privacy guardrails, and establishes design tokens before feature UI work begins.

## Technical Context
**Language/Version**: Dart 3.5 on Flutter 3.x (stable)  
**Primary Dependencies**: Riverpod, flutter_secure_storage, drift (SQLite), firebase_core/firebase_auth/cloud_firestore, speech_to_text, http+gRPC client for AI middleware, build_runner/freezed/json_serializable, flutter_dotenv, mocktail, golden_toolkit  
**Storage**: Local cache (drift + AES-256 via flutter_secure_storage) retaining 30 days of context/suggestions; Firebase Auth & Firestore for sync metadata and device registration  
**Testing**: flutter_test, integration_test, mocktail, golden_toolkit, Dart contract tests (schema validation)  
**Target Platform**: Android 10+ and iOS 15+ handsets (tablet/foldable support queued for follow-up research)  
**Project Type**: Mobile app with supporting API/middleware (Structure Option 3)  
**Performance Goals**: 60 fps UI baseline, <500 ms perceived assistant response after network round-trip, background sync completes within 5 minutes  
**Constraints**: GDPR/CCPA consent-first flows, offline access to last synced plan, voice payloads <5 MB, WCAG AA accessible Liquid Glass theming with reduced-motion fallbacks, documented data export/delete workflow, AES-256 key management  
**Scale/Scope**: MVP covering ~8 primary screens, 10k MAU target with burst to 100 concurrent AI sessions (GTM owner to confirm)

## Constitution Check
- [ ] Constitution ratified — `.specify/memory/constitution.md` remains a placeholder; interim waiver approved until 2025-10-05 (owners: A. Karimova, D. Lee) — governance must publish constitution before sign-off.
- [x] Test-first discipline — Plan mandates failing contract, integration, and golden tests before implementation tasks.
- [x] Documentation trail — Research, data-model, contracts, and quickstart updates precede coding work.
- [x] Traceability — Requirements map to explicit models, contracts, tests, and tasks.

*Blocker*: Missing constitution content is logged as R0; progress contingent on governance response but does not halt research/design activities.

## Project Structure

### Documentation (this feature)
```
specs/001-flutter-personal-ai/
├── plan.md
├── research.md
├── data-model.md
├── quickstart.md
├── contracts/
└── tasks.md
```

### Source Code (repository root)
```
api/
└── mock-server/          # gRPC/REST stubs backing contract tests

mobile/flutter_app/
├── lib/
│   ├── app.dart
│   ├── core/             # config, analytics, firebase adapters
│   ├── data/             # persistence, API clients
│   ├── domain/           # models, services, personalization engine
│   ├── features/         # onboarding, home, insights, alerts, voice
│   └── theme/            # Liquid Glass tokens and theming helpers
├── assets/
├── test/
│   ├── contracts/
│   ├── domain/
│   └── golden/
├── integration_test/
└── tool/
```

**Structure Decision**: Maintain Option 3 (Mobile + API) to isolate Flutter client work while hosting mock API fixtures under `api/mock-server/`.

## Phase 0: Outline & Research
1. Resolve outstanding follow-ups in `research.md`:
   - **R1**: Confirm AI middleware vendor (Vertex AI vs. alternatives), licensing, auth strategy, and on-device fallback plan; document network and rate-limit expectations.
   - **R2**: Obtain legal sign-off on GDPR/CCPA flows, 30-day retention, export/delete pipeline, and incident response ownership.
   - **R3**: Benchmark `speech_to_text` latency/accuracy on mid-tier Android/iOS devices; define wake-word roadmap and accessibility fallbacks.
   - **R4**: Validate prioritized integrations (Google Workspace first) via user research; scope Microsoft 365/iCloud connectors for backlog sequencing.
   - **R5**: Security review of encryption approach, key rotation, secure enclave usage, and automated purge scripts.
   - **R6**: Product approval for EN/ES/DE launch locales; choose localization vendor/tooling and QA cadence.
   - **R7**: Design sign-off for Liquid Glass tokens, motion-reduced variants, accessibility guardrails, and reference mockups.
   - **R0**: Governance team to populate `.specify/memory/constitution.md` or document temporary waiver.
2. Update `research.md` with confirmed decisions, rationales, owners, and deadlines; remove `[PENDING]` flags once approved.
3. Propagate resolved clarifications into `spec.md` and this plan (replace `[NEEDS CLARIFICATION]` markers) while logging residual risks.

## Phase 1: Design & Contracts
1. Finalize domain schemas in `data-model.md`:
   - Align consent audit, notification queue, and analytics fields with R2/R5 outcomes.
   - Detail boundary evaluation pipeline linking `personal_boundaries` to suggestion generation and alerts.
2. Author API/event contracts under `contracts/`:
   - `assistant.yaml` for `/assistant/session`, `/assistant/suggestions`, `/assistant/feedback` (request/response, retries, error envelope).
   - `context.yaml` for `/context/calendar` plus placeholders for email/task ingestion.
   - `notifications.yaml` for `/notifications/devices` and alert delivery receipts.
   - Document auth headers, pagination, and rate limiting metadata.
3. Produce failing contract tests in `mobile/flutter_app/test/contracts/` that validate schemas against the OpenAPI specs.
4. Define integration flows in `integration_test/`:
   - Onboarding consent journey with error handling for declined scopes.
   - Daily summary via text and voice including offline fallback.
   - Conflict alert workflow honoring quiet hours and boundary guard.
5. Update `quickstart.md` with mock server bootstrap steps, command matrix for tests, and credential rotation checklist.
6. Run `bash .specify/scripts/bash/update-agent-context.sh cursor` to sync agent guidance with the finalized plan details.

*Exit Criteria*: All clarifications closed or tracked with owners, data-model and contracts approved, contract/integration/golden tests outlined, quickstart refreshed, and agent files updated.

## Phase 2: Task Planning Approach
- Organize `tasks.md` by lifecycle: governance & environment, tests-first (contract/integration/golden), core implementation, integrations, polish/validation.
- Pair each contract/integration/golden test task with its implementation counterpart to enforce TDD; label parallel-safe tasks `[P]` when they touch disjoint files.
- Reference finalized contract filenames and domain modules in task titles to maintain traceability.
- Include compliance, accessibility, and performance validation tasks with explicit evidence expectations (logs, screenshots, profiling results).
- Capture required commands (e.g., `flutter test`, `flutter test integration_test`, mock server scripts) in task descriptions for repeatability.

## Complexity Tracking
- AI orchestration dependency risk: Mitigate via middleware abstraction and mock server parity tests before integrating live endpoints.
- Privacy/compliance obligation: No production data access until R2/R5 approvals documented; schedule audits in tasks.
- Liquid Glass performance concerns: Prototype blur-heavy screens early and profile on mid-tier Android devices to prevent regressions.

## Progress Tracking
**Phase Status**:
- [x] Phase 0: Research complete
- [x] Phase 1: Design complete
- [ ] Phase 2: Task planning complete
- [ ] Phase 3: Tasks generated (/tasks command)
- [ ] Phase 4: Implementation complete
- [ ] Phase 5: Validation passed

**Gate Status**:
- [ ] Initial Constitution Check: PASS
- [ ] Post-Design Constitution Check: PASS
- [x] All clarifications resolved or waived
- [ ] Complexity deviations documented with approvals

---
*Based on Constitution version pending ratification in `.specify/memory/constitution.md`*
