import fs from 'node:fs/promises';
import path from 'node:path';

import { createDefaultSession, createDefaultSuggestions } from '../src/store';

async function main() {
  const fixturesDir = path.resolve(__dirname, '..', 'fixtures');
  await fs.mkdir(fixturesDir, { recursive: true });

  const fixtures = new Map<string, unknown>([
    ['assistant_session.json', createDefaultSession()],
    ['assistant_suggestions.json', createDefaultSuggestions()],
    [
      'context_calendar.json',
      [
        {
          external_id: 'event-123',
          title: 'Leadership sync dry run',
          start: new Date(Date.now() + 2 * 60 * 60 * 1000).toISOString(),
          end: new Date(Date.now() + 3 * 60 * 60 * 1000).toISOString(),
          location: 'Room 12A',
          confidence_hint: 0.82,
        },
      ],
    ],
    [
      'context_gmail.json',
      [
        {
          external_id: 'msg-551',
          subject: 'Product roadmap feedback',
          snippet: 'Latest comments from the design review are in the doc.',
          received_at: new Date().toISOString(),
          importance: 'high',
        },
      ],
    ],
    [
      'notifications_devices.json',
      [
        {
          device_id: 'device-simulator-1',
          platform: 'android',
          push_token: 'demo-token',
          locale: 'en-US',
        },
      ],
    ],
    ['notifications_alerts.json', []],
  ]);

  for (const [file, data] of fixtures) {
    const resolved = path.join(fixturesDir, file);
    await fs.writeFile(resolved, JSON.stringify(data, null, 2), 'utf8');
    console.log(`Wrote ${file}`);
  }

  console.log('Mock fixtures seeded.');
}

main().catch((error) => {
  console.error('Failed to seed fixtures:', error);
  process.exitCode = 1;
});
