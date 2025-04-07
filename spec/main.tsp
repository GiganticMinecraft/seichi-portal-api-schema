import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";

import "./route/forms.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service(#{ title: "Seichi Portal API" })
@server("http://localhost:9000", "開発環境")
@useAuth(BearerAuth)
namespace SeichiPortalApiSchema;
