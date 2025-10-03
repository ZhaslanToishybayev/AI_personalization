"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const promises_1 = __importDefault(require("node:fs/promises"));
const node_path_1 = __importDefault(require("node:path"));
const store_1 = require("../src/store");
async function main() {
    const fixturesDir = node_path_1.default.resolve(__dirname, '..', 'fixtures');
    await promises_1.default.mkdir(fixturesDir, { recursive: true });
    const fixtures = new Map([
        ['assistant_session.json', (0, store_1.createDefaultSession)()],
        ['assistant_suggestions.json', (0, store_1.createDefaultSuggestions)()],
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
        const resolved = node_path_1.default.join(fixturesDir, file);
        await promises_1.default.writeFile(resolved, JSON.stringify(data, null, 2), 'utf8');
        console.log(`Wrote ${file}`);
    }
    console.log('Mock fixtures seeded.');
}
main().catch((error) => {
    console.error('Failed to seed fixtures:', error);
    process.exitCode = 1;
});
