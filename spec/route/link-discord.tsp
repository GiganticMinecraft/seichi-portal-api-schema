import "@typespec/http";
import "../models/external.tsp";
import "../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/link-discord")
@tag("External")
namespace LinkDiscord.Router {
  using External.Models;

  alias LinkDiscordRouter = NeedsAuthorizationTemplates<DiscordOAuthToken>;

  @summary("Discord アカウントとリンクする")
  op LinkDiscord(
    @header
    contentType: "application/json",

    @body body: DiscordOAuthToken,
  ): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @summary("Discord アカウントとのリンクを解除する")
  op UnlinkDiscord is LinkDiscordRouter.delete<{}>;
}
