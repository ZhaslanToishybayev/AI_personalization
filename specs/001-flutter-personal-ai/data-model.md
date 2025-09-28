# Data Model — Personal AI Assistant Mobile App

## 1. User Profile
- **Identifier**: `user_id` (UUID from auth provider)
- **Core Attributes**:
  - `display_name`
  - `email`
  - `locale`
  - `time_zone`
  - `working_hours` (start/end, weekdays)
  - `notification_settings` (channels, quiet hours, critical overrides)
  - `privacy_consents` (scoped flags with timestamps and version)
  - `personal_boundaries` (topics to avoid, escalation rules, suppression windows)
  - `last_export_request_at` (nullable timestamp)
  - `quiet_hours_enabled` (bool)
- **Relationships**:
  - 1:N with Context Signals
  - 1:N with Assistive Suggestions
  - 1:N with Interaction Sessions
  - 1:N with Consent Audit Log entries
- **Lifecycle Notes**: Created on onboarding; deletion queue triggers anonymization within 72 hours; retained aggregates exclude PII.

## 2. Context Signal
- **Identifier**: `signal_id` (UUID)
- **Core Attributes**:
  - `user_id`
  - `source_system` (calendar, email, tasks, manual)
  - `source_identifier` (external event/message ID)
  - `ingested_at`
  - `priority_score`
  - `expires_at`
  - `permissions_scope`
  - `payload_digest` (hash of content for dedupe)
  - `confidence_hint` (optional numeric derived from provider)
- **Relationships**:
  - N:1 to User Profile
  - N:1 (optional) to Interaction Session when consumed
- **Lifecycle Notes**: Purged or archived after 30 days; purge generates audit entry when records removed.

## 3. Assistive Suggestion
- **Identifier**: `suggestion_id`
- **Core Attributes**:
  - `user_id`
  - `trigger_context_ids` (list of Context Signal references)
  - `generated_at`
  - `suggestion_type` (daily_plan, reminder, summary, automation, alert)
  - `message`
  - `explanation` (structured JSON: sources, justification, confidence)
  - `confidence_score`
  - `status` (pending, accepted, declined, snoozed, expired)
  - `feedback_note`
  - `boundary_violation_flag` (bool)
- **Relationships**:
  - N:1 to User Profile
  - 1:N to Interaction Sessions (if discussed across sessions)
- **Lifecycle Notes**: Feedback updates status; expired items auto-archive; boundary violations logged for analytics.

## 4. Interaction Session
- **Identifier**: `session_id`
- **Core Attributes**:
  - `user_id`
  - `channel` (text, voice)
  - `started_at`
  - `ended_at`
  - `intent_labels` (top-level intents detected)
  - `transcript_reference` (secure blob location, purged after 30 days)
  - `actions_taken` (list of triggered operations)
  - `latency_metrics` (request/response timings)
- **Relationships**:
  - N:1 to User Profile
  - N:1 to Assistive Suggestion (if feedback recorded)
  - N:M to Context Signals (through join for data reuse)
- **Lifecycle Notes**: Redact PII when user requests deletion; anonymized metrics retained for performance analysis.

## 5. Consent Audit Log
- **Identifier**: `audit_id`
- **Core Attributes**:
  - `user_id`
  - `event_type` (consent_granted, consent_revoked, export_requested, delete_requested)
  - `scope`
  - `occurred_at`
  - `actor` (user, system, support)
  - `notes`
- **Relationships**:
  - N:1 to User Profile
- **Lifecycle Notes**: Immutable; stored for minimum 24 months per compliance policy.

## 6. Notification Queue Item
- **Identifier**: `notification_id`
- **Core Attributes**:
  - `user_id`
  - `suggestion_id` (optional)
  - `channel` (in_app, push)
  - `priority` (normal, critical)
  - `quiet_hours_override` (bool)
  - `scheduled_for`
  - `delivered_at`
  - `delivery_attempts`
- **Relationships**:
  - N:1 to User Profile
  - N:1 to Assistive Suggestion
- **Lifecycle Notes**: Items expire if undelivered within 24 hours; audit records stored before removal.

## Derived Views & Supporting Structures
- **Daily Plan Snapshot**: Flattened view of accepted suggestions and schedule for given date, cached to speed offline access.
- **Boundary Guard Config**: Materialized settings that pair personal boundaries with enforcement logic (topics, escalation targets, override tokens).
- **Localization Bundle**: Aggregated strings per locale with last_sync_at metadata for translation pipeline health checks.

## Validation Considerations
- Enforce unique `(user_id, source_identifier)` for Context Signals to prevent duplicates.
- Guard `confidence_score` within configured bounds (0.0–1.0) and align with explanation requirements.
- Ensure `personal_boundaries` are evaluated before generating or sending suggestions; log attempted violations.
- Apply locale-aware formatting for user-facing strings derived from data and flag missing translations in CI.
- Require consent audit entries on every consent/boundary/DSR change.
