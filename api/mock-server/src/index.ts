import express, { NextFunction, Request, Response } from 'express';
import cors from 'cors';
import morgan from 'morgan';
import SwaggerParser from '@apidevtools/swagger-parser';
// express-openapi-validator v5 exposes both CJS and ESM shapes; load namespace to handle either.
import * as OpenApiValidator from 'express-openapi-validator';

import { loadOpenApiDocument } from './openapi';
import { AlertRecord, DeviceRegistration, MockStore } from './store';

const PORT = Number(process.env.PORT ?? '8787');

async function bootstrap() {
  const app = express();
  app.use(cors());
  app.use(express.json({ limit: '5mb' }));
  app.use(morgan('tiny'));

  const apiDoc = await loadOpenApiDocument();
  await SwaggerParser.validate(apiDoc);

  const validatorExport: any = (OpenApiValidator as any)?.default ?? (OpenApiValidator as any);
  if (typeof validatorExport === 'function') {
    await new validatorExport({
      apiSpec: apiDoc as any,
      validateRequests: true,
      validateResponses: true,
    }).install(app);
  } else {
    const namespace: any = typeof validatorExport === 'object' ? validatorExport : OpenApiValidator;
    if (typeof namespace?.middleware === 'function') {
      app.use(
        await namespace.middleware({
          apiSpec: apiDoc as any,
          validateRequests: true,
          validateResponses: true,
        }),
      );
    } else {
      throw new Error('Failed to initialize express-openapi-validator: unknown export shape');
    }
  }

  const store = new MockStore();
  await store.loadFixtures();

  app.get('/health', (_req, res) => {
    res.json({ status: 'ok', time: new Date().toISOString() });
  });

  app.post('/assistant/session', async (req, res, next) => {
    try {
      const { channel, locale } = req.body as { channel: string; locale: string };
      const session = await store.createSession(channel, locale);
      res.json(session);
    } catch (error) {
      next(error);
    }
  });

  app.get('/assistant/suggestions', (req, res, next) => {
    try {
      const filter = typeof req.query.filter === 'string' ? req.query.filter : undefined;
      const maxResultsRaw = req.query.max_results ? Number(req.query.max_results) : undefined;
      const maxResults = Number.isFinite(maxResultsRaw) ? maxResultsRaw : undefined;
      const { suggestions, hasMore } = store.listSuggestions(filter, maxResults);
      if (hasMore) {
        res.setHeader('X-Next-Cursor', 'more');
      }
      res.json({ suggestions });
    } catch (error) {
      next(error);
    }
  });

  app.post('/assistant/feedback', async (req, res, next) => {
    try {
      const body = req.body as { suggestion_id: string; status: string; note?: string };
      await store.recordFeedback(body.suggestion_id, body.status, body.note);
      res.status(204).send();
    } catch (error) {
      next(error);
    }
  });

  app.post('/context/calendar', async (req, res, next) => {
    try {
      await store.upsertCalendarEvents(req.body);
      res.status(202).send();
    } catch (error) {
      next(error);
    }
  });

  app.post('/context/gmail', async (req, res, next) => {
    try {
      await store.upsertGmailMessages(req.body);
      res.status(202).send();
    } catch (error) {
      next(error);
    }
  });

  app.put('/notifications/devices', async (req, res, next) => {
    try {
      await store.registerDevice(req.body as DeviceRegistration);
      res.status(204).send();
    } catch (error) {
      next(error);
    }
  });

  app.post('/notifications/alerts', async (req, res, next) => {
    try {
      const alert: AlertRecord = {
        ...(req.body as AlertRecord),
        enqueued_at: new Date().toISOString(),
      };
      await store.enqueueAlert(alert);
      res.status(202).send();
    } catch (error) {
      next(error);
    }
  });

  app.use(
    (err: any, _req: Request, res: Response, next: NextFunction) => {
      if (err.status && err.errors) {
        res.status(err.status).json({
          message: err.message,
          errors: err.errors,
        });
        return;
      }
      next(err);
    },
  );

  app.use((err: any, _req: Request, res: Response) => {
    console.error(err);
    res.status(500).json({ message: 'Unexpected server error' });
  });

  app.listen(PORT, () => {
    console.log(`Mock middleware listening on http://localhost:${PORT}`);
  });
}

bootstrap().catch((error) => {
  console.error('Failed to bootstrap mock server:', error);
  process.exitCode = 1;
});
