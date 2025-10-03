"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
const swagger_parser_1 = __importDefault(require("@apidevtools/swagger-parser"));
const openapi_1 = require("../src/openapi");
async function main() {
    const document = await (0, openapi_1.loadOpenApiDocument)();
    const api = await swagger_parser_1.default.validate(document);
    const pathCount = Object.keys(api.paths ?? {}).length;
    console.log(`OpenAPI document validated (${pathCount} paths).`);
}
main().catch((error) => {
    console.error('OpenAPI validation failed:', error);
    process.exitCode = 1;
});
