import "@typespec/http";
import "../../models/forms/answers.tsp";
import "../../interfaces/needs-authorization-templates.tsp";
import "../../models/forms/label_for_form.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("LabelForForm")
@route("/labels/forms")
namespace LabelForForm.Router {
  using LabelForForm.Models;

  alias LabelForFormRouter = NeedsAuthorizationTemplates<LabelForForm>;

  @summary("フォーム用ラベルを作成する")
  op CreateLabelForForm is LabelForFormRouter.create<{}>;

  @summary("フォーム用ラベルの一覧を取得する")
  op ListLabelForForm is LabelForFormRouter.list<{}>;

  @route("/{label_id}")
  namespace PerLabelForForm {
    @summary("フォーム用ラベルを取得する")
    op GetLabelForForm is LabelForFormRouter.get<{
      @path
      label_id: labelForFormId;
    }>;

    @summary("フォーム用ラベルを更新する")
    @patch
    op UpdateLabelForForm(
      @path
      label_id: labelForFormId,

      @body body: MergePatchUpdate<LabelForForm>,
    ):
      | {
          ...OkResponse;
          @body body: LabelForForm;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @summary("フォーム用ラベルを削除する")
    op DeleteLabelForForm is LabelForFormRouter.delete<{
      @path
      label_id: labelForFormId;
    }>;
  }
}
