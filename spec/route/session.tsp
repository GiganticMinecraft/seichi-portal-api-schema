import "@typespec/http";
import "../interfaces/needs-authorization-templates.tsp";
import "../models/session.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/session")
@tag("Session")
namespace Session.Router {
  using Session.Models;

  alias SessionRouter = NeedsAuthorizationTemplates<SessionExpires>;

  @summary("セッションを作成する")
  op CreateSession is SessionRouter.createWithAdditionalResponseParams<
    {},
    {
      @header
      SetCookie: string;
    }
  >;

  @summary("セッションを削除する")
  op DeleteSession is SessionRouter.deleteWithAdditionalResponseParams<
    {},
    {
      @header
      SetCookie: string;
    }
  >;
}
