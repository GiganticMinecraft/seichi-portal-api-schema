import "@typespec/http";
import "../models/session.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/session")
@tag("Session")
namespace Session.Router {
  using Session.Models;

  @summary("セッションを作成する")
  @post
  op CreateSession(@body body: SessionExpires):
    | {
        @header
        SetCookie: string;
      }
    | BadRequest
    | Unauthorized
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @summary("セッションを削除する")
  @delete
  op DeleteSession():
    | NoContentResponse
    | BadRequest
    | Unauthorized
    | NotFound
    | UnprocessableEntity
    | InternalServerError;
}
