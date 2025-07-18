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

  @summary("横断検索を行う")
  @get
  op CrossSearch(
    @query
    @minLength(1)
    query: string,
  ):
    | {
        ...OkResponse;
        @body body: CrossSearchResult;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | InternalServerError;
}
