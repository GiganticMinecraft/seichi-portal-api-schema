import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "../../models/form.tsp";
import "../../interfaces/needs_authorization_templates.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;
using TypeSpec.OpenAPI;

@service
namespace SeichiPortalApiSchema;

@route("/forms")
@tag("Forms")
namespace Forms.Route {
  alias FormRouter = NeedsAuthorizationTemplates<Forms.Models.Form>;

  @summary("フォームの作成")
  op create_form is FormRouter.create;

  @summary("フォームの一覧取得")
  op list_forms is FormRouter.list;

  @route("/{id}")
  @summary("フォームの取得")
  op get_form is FormRouter.get;

  @route("/{id}")
  @summary("フォームの更新")
  op update_form is FormRouter.update;

  @route("/{id}")
  @summary("フォームの削除")
  op delete_form is FormRouter.delete;
}
