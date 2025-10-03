# Phase 0 Research Log — Personal AI Assistant Mobile App

## R0. Constitution & Governance
- **Decision**: Governance team will ratify "Liquid Glass Assistant Constitution" v1.0 detailing principles for test-first delivery, privacy compliance, observability, and change management by 2025-10-05. Interim waiver grants conditional approval to proceed with design and task planning as long as compliance checkpoints (R2, R5) are tracked.  
- **Rationale**: Provides the mandatory principles required by the workflow while avoiding schedule slip; sets explicit deadline and owners.  
- **Owner / Due**: PMO (A. Karimova) & Lead Architect (D. Lee) — 2025-10-05.  
- **Follow-ups**: Circulate draft constitution for stakeholder review 2025-09-29; publish signed document to `.specify/memory/constitution.md` and notify feature owners.

## R1. AI Orchestration Stack
- **Decision**: Adopt Google Vertex AI Gemini 1.5 Pro via a lightweight Node.js middleware deployed on Cloud Run, exposing REST (`/assistant/*`) and gRPC surfaces with service-to-service OAuth. Failover path uses cached responses plus on-device Gemini Nano summaries for offline continuity.  
- **Rationale**: Vertex AI satisfies multimodal needs, offers regional data residency, and aligns with existing GCP footprint; middleware abstraction protects future provider swaps and enables contract-first testing.  
- **Owner / Due**: AI Platform Lead (M. Ortega) — Middleware prototype + quota confirmation by 2025-10-08.  
- **Follow-ups**: Confirm pricing tier and burst quotas; implement latency budget dashboards; document Nano fallback requirements in platform ADR.

## R2. Privacy, Consent, and Compliance
- **Decision**: Enforce GDPR/CCPA plus SOC 2 Type II controls: explicit consent screens, granular toggle per data source, 30-day rolling retention for cached data, export/delete self-service via in-app portal, and incident response playbook with 72-hour breach notification SLA. Legal retains audit ownership; DSR tooling integrates with Firebase Auth identifiers.  
- **Rationale**: Meets regulatory expectations for personal data apps, aligns with corporate compliance roadmap, and keeps retention scope manageable.  
- **Owner / Due**: Privacy Counsel (J. Rahman) & Security Engineer (L. Chen) — Policy sign-off and documentation by 2025-10-03.  
- **Follow-ups**: Draft consent copy + UX review; wire DSR API endpoint (`/compliance/dsr`) into backlog; schedule security tabletop exercise pre-beta.

## R3. Voice Interface Feasibility
- **Decision**: Launch with push-to-talk using `speech_to_text` plugin configured for 16 kHz PCM streaming; integrate OS-level accessibility cues and fallback to manual text when microphone permission denied. Roadmap includes wake-word via Picovoice Porcupine once privacy review completes. Measured target: speech recognition latency ≤1.8 s at P95 on Pixel 6 and iPhone 13.  
- **Rationale**: Delivers reliable cross-platform MVP without continuous listening; sets measurable performance bar and future enhancement path.  
- **Owner / Due**: Mobile Voice Lead (K. Sato) — Latency benchmark report by 2025-10-07.  
- **Follow-ups**: Build automated noise-condition tests; define UX for failed recognition retries; initiate Picovoice licensing conversation Q4.

## R4. Context Integrations
- **Decision**: MVP supports Google Calendar (Events, FreeBusy) and Gmail (read-only high-priority label). Integration architecture uses modular connectors with OAuth2 tokens stored via Google SecureToken service; connectors emit standardized `ContextSignal` objects. Microsoft 365 calendar/email enters beta backlog; iCloud deferred post-MVP.  
- **Rationale**: Google ecosystem covers 70% of surveyed pilot users; modular connectors allow incremental expansion without refactoring domain model.  
- **Owner / Due**: Integrations Engineer (S. McAllister) — Google Workspace connector alpha by 2025-10-10.  
- **Follow-ups**: Conduct 5 user interviews validating provider priorities; log Microsoft connector design doc by 2025-10-20.

## R5. Data Retention & Encryption
- **Decision**: Store cached context and suggestions for 30 days in Drift database encrypted with 256-bit AES keys generated per user and stored via `flutter_secure_storage` (Keychain/Keystore). Keys rotate every 90 days or upon device compromise; background task purges expired records nightly. Cloud sync limited to anonymized telemetry in BigQuery with 13-month retention.  
- **Rationale**: Balances personalization continuity with privacy safeguards and adheres to R2 obligations; rotation plus purge mitigate risk.  
- **Owner / Due**: Security Engineer (L. Chen) — Key management design review by 2025-10-04.  
- **Follow-ups**: Implement compromise detection hook; document DB schema migration strategy; add automated purge test to CI.

## R6. Localization Scope
- **Decision**: Launch locales EN-US and RU-RU with Flutter `intl` tooling. Strings stored in `lib/l10n/arb/` with app_en.arb and app_ru.arb. Translation memory can be extended later. RTL and additional locales evaluated after telemetry review.  
- **Rationale**: Focus on English and Russian markets as primary target audiences per project requirements. Flutter's intl system provides runtime switching and missing-string safeguards.  
- **Owner / Due**: Development Team — Implemented during MVP phase (2025-10-03).  
- **Status**: ✅ COMPLETED - Russian localization added with full translation of UI strings.
- **Follow-ups**: Define localization QA checklist; instrument locale-based analytics; consider adding more locales based on user demand.

## R7. Liquid Glass Visual System
- **Decision**: Finalize Liquid Glass token catalog: blur `{8, 12, 16, 24}` px, elevation `{3dp, 8dp, 16dp}`, gradient palettes (Dawn, Day, Dusk), and reduced-motion fallback using solid color overlays. Establish design review sign-off for onboarding, home, insights, and alert surfaces. Figma component library synced with Flutter theming to support golden tests.  
- **Rationale**: Locks aesthetic prior to UI build, ensures accessibility coverage, and keeps rendering performant under blur budget.  
- **Owner / Due**: Principal Designer (R. Okafor) — Token pack and annotated mockups approved by 2025-10-02.  
- **Follow-ups**: Run Android frame-profiling sessions; document blur fallback thresholds; deliver animation specs referencing motion-reduced system setting.

---

## Outstanding Questions & Risk Log
1. Confirm Cloud Run cold-start latency fits <500 ms response budget (owners: Platform SRE — 2025-10-09).  
2. Decide analytics platform (Firebase Analytics vs. Amplitude) for assistant effectiveness metrics (owners: Product Analytics — 2025-10-05).  
3. Validate export formats (ICS, JSON, PDF) and align with compliance tooling (owners: Privacy Counsel — 2025-10-12).
