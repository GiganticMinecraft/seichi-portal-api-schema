import "@typespec/http";
import "../models/forms/forms.tsp";
import "../models/users.tsp";
import "../models/errors.tsp";
import "../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/users")
@tag("Users")
namespace Users.Router {
  using Users.Models;

  alias UserRouter = NeedsAuthorizationTemplates<User>;

  @summary("ユーザーの一覧取得")
  op ListUsers is UserRouter.list<{}>;

  @route("/me")
  @summary("自分のユーザー情報の取得")
  op GetMe is UserRouter.get<{}>;

  @route("/{id}")
  @summary("ユーザーの取得")
  op GetUser is UserRouter.get<{
    @path
    id: userId;
  }>;

  @route("/{id}")
  @summary("ユーザーの更新")
  @patch
  op UpdateUser(
    @path
    id: userId,

    @header
    contentType: "application/merge-patch+json",

    @body body: MergePatchUpdate<User>,
  ):
    | {
        ...OkResponse;
        @body body: User;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity;
}
