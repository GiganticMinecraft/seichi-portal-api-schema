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
  @patch
  op UpdateForm(
    @path
    id: formId,

    @body body: MergePatchUpdate<Form>,
  ):
    | {
        ...OkResponse;
        @body body: Form;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @route("/{id}")
  @summary("フォームの削除")
  op DeleteForm is FormRouter.delete<{
    @path
    id: formId;
  }>;
}
