import "@typespec/http";
import "../models/external.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/link-discord")
@tag("External")
namespace LinkDiscord.Router {
  using External.Models;

  @summary("Discord アカウントとリンクする")
  @post
  op LinkDiscord(
    @header
    contentType: "application/json",

    @body body: DiscordOAuthToken,
  ):
    | NoContentResponse
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @summary("Discord アカウントとのリンクを解除する")
  @delete
  op UnlinkDiscord():
    | NoContentResponse
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;
}
