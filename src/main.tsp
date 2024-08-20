import "./endpoints/forms.tsp";
import "./endpoints/users.tsp";
import "./endpoints/session.tsp";
import "@typespec/openapi";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service({
  title: "seichi-portal-api-schema",
})
@server("http://localhost:9000", "開発環境")
@useAuth(BearerAuth)
@info({
  license: {
    name: "Apache 2.0",
    url: "http://www.apache.org/licenses/LICENSE-2.0.html",
  },
})
namespace SeichiPortalApiSchema;
