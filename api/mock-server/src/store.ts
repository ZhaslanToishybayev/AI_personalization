import fs from 'node:fs/promises';
import path from 'node:path';

type JsonValue = string | number | boolean | null | JsonValue[] | { [key: string]: JsonValue };

export interface SessionResponse {
  session_id: string;
  expires_at: string;
  warmup_summary: string;
  personalization_state?: Record<string, JsonValue>;
}

export interface Suggestion {
  id: string;
  status: string;
  [key: string]: JsonValue;
}

export interface DeviceRegistration extends Record<string, JsonValue> {
  device_id: string;
}

export interface AlertRecord extends Record<string, JsonValue> {
  user_id: string;
  title: string;
}

export class MockStore {
  private readonly fixturesDir: string;
  private session: SessionResponse = createDefaultSession();
  private suggestions: Suggestion[] = createDefaultSuggestions();
  private calendarEvents: JsonValue[] = [];
  private gmailMessages: JsonValue[] = [];
  private devices: DeviceRegistration[] = [];
  private alerts: AlertRecord[] = [];

  constructor(fixturesDir?: string) {
    this.fixturesDir = fixturesDir ?? path.resolve(__dirname, '..', 'fixtures');
  }

  async loadFixtures() {
    this.session = await this.readFixture('assistant_session.json', createDefaultSession());
    this.suggestions = await this.readFixture(
      'assistant_suggestions.json',
      createDefaultSuggestions(),
    );
    this.calendarEvents = await this.readFixture('context_calendar.json', []);
    this.gmailMessages = await this.readFixture('context_gmail.json', []);
    this.devices = await this.readFixture('notifications_devices.json', []);
    this.alerts = await this.readFixture('notifications_alerts.json', []);
  }

  getSession(): SessionResponse {
    return { ...this.session };
  }

  async createSession(channel: string, locale: string): Promise<SessionResponse> {
    const expiresAt = new Date(Date.now() + 30 * 60 * 1000).toISOString();
    const session: SessionResponse = {
      ...this.session,
      session_id: `sess-${Date.now()}`,
      expires_at: expiresAt,
      personalization_state: {
        ...(this.session.personalization_state ?? {}),
        last_channel: channel,
        locale,
      },
    };
    this.session = session;
    await this.writeFixture('assistant_session.json', session);
    return { ...session };
  }

  listSuggestions(filter?: string, maxResults?: number) {
    let entries = [...this.suggestions];
    if (filter) {
      const allowed = filter.split(',').map((value) => value.trim());
      entries = entries.filter((item) => {
        const suggestionType = item.suggestion_type as string | undefined;
        return !suggestionType || allowed.includes(suggestionType);
      });
    }
    if (maxResults && maxResults > 0 && entries.length > maxResults) {
      return { suggestions: entries.slice(0, maxResults), hasMore: true };
    }
    return { suggestions: entries, hasMore: false };
  }

  async recordFeedback(suggestionId: string, status: string, note?: string) {
    const updated: Suggestion[] = this.suggestions.map((item) => {
      if (item.id !== suggestionId) {
        return item;
      }
      const next: Suggestion = {
        ...item,
        status,
        last_feedback_at: new Date().toISOString(),
      };
      if (note) {
        next.last_feedback_note = note;
      } else {
        delete next.last_feedback_note;
      }
      return next;
    });
    this.suggestions = updated;
    await this.writeFixture('assistant_suggestions.json', updated);
  }

  async upsertCalendarEvents(payload: {
    user_id: string;
    events: JsonValue[];
    deleted_event_ids?: string[];
    sync_token?: string;
  }) {
    const remaining = this.calendarEvents.filter((event) => {
      if (!payload.deleted_event_ids) return true;
      const externalId = getProperty(event, 'external_id');
      return !payload.deleted_event_ids?.includes(String(externalId));
    });
    this.calendarEvents = [...remaining, ...payload.events];
    await this.writeFixture('context_calendar.json', this.calendarEvents);
  }

  async upsertGmailMessages(payload: {
    user_id: string;
    messages: JsonValue[];
    sync_token?: string;
  }) {
    const incomingIds = new Set(
      payload.messages.map((item) => String(getProperty(item, 'external_id'))),
    );
    const retained = this.gmailMessages.filter((message) => {
      const externalId = getProperty(message, 'external_id');
      return !incomingIds.has(String(externalId));
    });
    this.gmailMessages = [...retained, ...payload.messages];
    await this.writeFixture('context_gmail.json', this.gmailMessages);
  }

  async registerDevice(payload: DeviceRegistration) {
    const filtered = this.devices.filter((device) => device.device_id !== payload.device_id);
    this.devices = [...filtered, payload];
    await this.writeFixture('notifications_devices.json', this.devices);
  }

  async enqueueAlert(alert: AlertRecord) {
    this.alerts = [...this.alerts, alert];
    await this.writeFixture('notifications_alerts.json', this.alerts);
  }

  getAlerts(): AlertRecord[] {
    return [...this.alerts];
  }

  private async readFixture<T>(fileName: string, fallback: T): Promise<T> {
    try {
      const raw = await fs.readFile(path.join(this.fixturesDir, fileName), 'utf8');
      return JSON.parse(raw) as T;
    } catch (error) {
      const code = (error as NodeJS.ErrnoException).code;
      if (code === 'ENOENT') {
        return fallback;
      }
      throw error;
    }
  }

  private async writeFixture<T>(fileName: string, data: T) {
    await fs.mkdir(this.fixturesDir, { recursive: true });
    await fs.writeFile(
      path.join(this.fixturesDir, fileName),
      JSON.stringify(data, null, 2),
      'utf8',
    );
  }
}

export function createDefaultSession(): SessionResponse {
  return {
    session_id: 'sess-bootstrap',
    expires_at: new Date(Date.now() + 15 * 60 * 1000).toISOString(),
    warmup_summary:
        'Welcome back! You have three focus blocks this morning and two pending follow-ups.',
    personalization_state: {
      daily_focus_theme: 'Intentional planning',
      upcoming_conflicts: 1,
      quiet_hours_active: false,
    },
  };
}

export function createDefaultSuggestions(): Suggestion[] {
  return [
    {
      id: 'suggestion-1',
      suggestion_type: 'daily_plan',
      message: 'Lock 90 minutes for prep before the leadership sync.',
      status: 'pending',
      explanation: {
        rationale: 'Leadership sync agenda updated with new topics.',
      },
      confidence_score: 0.82,
      actions: [
        {
          label: 'Schedule focus block',
          action_type: 'schedule_block',
        },
      ],
    },
    {
      id: 'suggestion-2',
      suggestion_type: 'alert',
      message: 'Travel reminder: leave by 18:15 for the airport.',
      status: 'pending',
      explanation: {
        rationale: 'Commute time trending longer due to construction along I-5.',
      },
      confidence_score: 0.74,
      actions: [
        {
          label: 'View itinerary',
          action_type: 'open_link',
          href: 'https://travel.example.com/itinerary',
        },
      ],
    },
  ];
}

function getProperty(value: JsonValue, key: string): JsonValue | undefined {
  if (value && typeof value === 'object' && !Array.isArray(value)) {
    return (value as Record<string, JsonValue>)[key];
  }
  return undefined;
}
