import fs from 'node:fs/promises';
import path from 'node:path';

import { OpenAPIV3 } from 'openapi-types';
import YAML from 'yaml';

const CONTRACT_ROOT = path.resolve(
  __dirname,
  '..',
  '..',
  '..',
  'specs',
  '001-flutter-personal-ai',
  'contracts',
);

const CONTRACT_FILES = ['assistant.yaml', 'context.yaml', 'notifications.yaml'];

const COMPONENT_KEYS: (keyof OpenAPIV3.ComponentsObject)[] = [
  'schemas',
  'responses',
  'parameters',
  'examples',
  'requestBodies',
  'headers',
  'securitySchemes',
  'links',
  'callbacks',
];

export async function loadOpenApiDocument(): Promise<OpenAPIV3.Document> {
  const documents = await Promise.all(CONTRACT_FILES.map(loadContract));

  const merged: OpenAPIV3.Document = {
    openapi: '3.0.3',
    info: {
      title: 'Personal AI Mock Middleware',
      version: '0.1.0',
      description:
          'Aggregated contract for assistant/context/notifications mock server.',
    },
    servers: [
      {
        url: 'http://localhost:8787',
        description: 'Local mock middleware',
      },
    ],
    paths: {},
    components: {},
  };

  const securityRequirements: OpenAPIV3.SecurityRequirementObject[] = [];
  const tags: OpenAPIV3.TagObject[] = [];

  for (const doc of documents) {
    if (doc.paths) {
      mergePaths(merged.paths, doc.paths);
    }
    if (doc.components) {
      merged.components = mergeComponents(merged.components ?? {}, doc.components);
    }
    if (Array.isArray(doc.security)) {
      for (const entry of doc.security) {
        if (!securityRequirements.some((existing) => isSecurityEqual(existing, entry))) {
          securityRequirements.push(entry);
        }
      }
    }
    if (Array.isArray(doc.tags)) {
      for (const tag of doc.tags) {
        if (!tags.some((existing) => existing.name === tag.name)) {
          tags.push(tag);
        }
      }
    }
  }

  if (securityRequirements.length > 0) {
    merged.security = securityRequirements;
  }

  if (tags.length > 0) {
    merged.tags = tags;
  }

  return merged;
}

async function loadContract(fileName: string): Promise<OpenAPIV3.Document> {
  const filePath = path.join(CONTRACT_ROOT, fileName);
  const raw = await fs.readFile(filePath, 'utf8');
  const parsed = YAML.parse(raw) as OpenAPIV3.Document;
  return parsed;
}

function mergePaths(
  target: OpenAPIV3.PathsObject,
  source: OpenAPIV3.PathsObject,
) {
  for (const [key, value] of Object.entries(source)) {
    if (!target[key]) {
      target[key] = value;
      continue;
    }

    const targetPathItem = target[key];
    const sourcePathItem = value;

    if (targetPathItem && sourcePathItem && typeof targetPathItem === 'object' && typeof sourcePathItem === 'object') {
      Object.assign(targetPathItem, sourcePathItem);
    } else {
      target[key] = value;
    }
  }
}

function mergeComponents(
  target: OpenAPIV3.ComponentsObject,
  source: OpenAPIV3.ComponentsObject,
): OpenAPIV3.ComponentsObject {
  for (const key of COMPONENT_KEYS) {
    const sourceSection = source[key];
    if (!sourceSection) continue;

    const destination = (target[key] ?? {}) as Record<string, unknown>;
    const incoming = sourceSection as Record<string, unknown>;
    Object.assign(destination, incoming);
    target[key] = destination as any;
  }
  return target;
}

function isSecurityEqual(
  a: OpenAPIV3.SecurityRequirementObject,
  b: OpenAPIV3.SecurityRequirementObject,
): boolean {
  const aKeys = Object.keys(a).sort();
  const bKeys = Object.keys(b).sort();
  if (aKeys.length != bKeys.length) {
    return false;
  }

  for (let i = 0; i < aKeys.length; i++) {
    if (aKeys[i] !== bKeys[i]) {
      return false;
    }
    const aValues = (a[aKeys[i]] ?? []).slice().sort();
    const bValues = (b[bKeys[i]] ?? []).slice().sort();
    if (aValues.length !== bValues.length) {
      return false;
    }
    for (let j = 0; j < aValues.length; j++) {
      if (aValues[j] !== bValues[j]) {
        return false;
      }
    }
  }

  return true;
}
