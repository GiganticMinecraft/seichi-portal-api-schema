import "@typespec/http";
import "../../models/forms/forms.tsp";
import "../../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/forms")
@tag("Forms")
namespace Forms.Route {
  using Forms.Models;

  alias FormRouter = NeedsAuthorizationTemplates<Form>;

  @summary("フォームの作成")
  op CreateForm is FormRouter.create<{}>;

  @summary("フォームの一覧取得")
  op ListForm is FormRouter.list<{}>;

  @route("/{id}")
  @summary("フォームの取得")
  op GetForm is FormRouter.get<{
    @path
    id: formId;
  }>;

  @route("/{id}")
  @summary("フォームの更新")
  op UpdateForm is FormRouter.update<{
    @path
    id: formId;
  }>;

  @route("/{id}")
  @summary("フォームの削除")
  op DeleteForm is FormRouter.delete<{
    @path
    id: formId;
  }>;
}
