import SwaggerParser from '@apidevtools/swagger-parser';

import { loadOpenApiDocument } from '../src/openapi';

async function main() {
  const document = await loadOpenApiDocument();
  const api = await SwaggerParser.validate(document);
  const pathCount = Object.keys(api.paths ?? {}).length;
  console.log(`OpenAPI document validated (${pathCount} paths).`);
}

main().catch((error) => {
  console.error('OpenAPI validation failed:', error);
  process.exitCode = 1;
});
