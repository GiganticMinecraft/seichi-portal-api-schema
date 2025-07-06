import "@typespec/http";
import "../interfaces/needs-authorization-templates.tsp";
import "../models/search.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/search")
@tag("Search")
namespace Search.Router {
  using Search.Models;

  alias SearchRouter = NeedsAuthorizationTemplates<CrossSearchResult>;

  @summary("横断検索を行う")
  op CrossSearch is SearchRouter.get<{
    @query
    query: string;
  }>;
}
