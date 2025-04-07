import "@typespec/http";
import "@typespec/rest";
import "@typespec/openapi";
import "../models/forms/form.tsp";
import "../interfaces/needs_authorization_templates.tsp";

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
  op CreateForm is FormRouter.create<{}>;

  @summary("フォームの一覧取得")
  op ListForm is FormRouter.list<{}>;

  @route("/{id}")
  @summary("フォームの取得")
  op GetForm is FormRouter.get<{
    @path
    id: Forms.Models.FormId;
  }>;

  @route("/{id}")
  @summary("フォームの更新")
  op UpdateForm is FormRouter.update<{
    @path
    id: Forms.Models.FormId;
  }>;

  @route("/{id}")
  @summary("フォームの削除")
  op DeleteForm is FormRouter.delete<{
    @path
    id: Forms.Models.FormId;
  }>;
}
