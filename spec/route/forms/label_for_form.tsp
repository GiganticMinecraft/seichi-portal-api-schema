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

  @summary("フォーム用ラベルを作成する")
  @post
  op CreateLabelForForm(@body body: LabelForForm):
    | {
        ...CreatedResponse;
        ...LocationHeader;
        @body body: LabelForForm;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | UnprocessableEntity
    | InternalServerError;

  @summary("フォーム用ラベルの一覧を取得する")
  @get
  op ListLabelForForm():
    | {
        ...OkResponse;
        @body body: LabelForForm[];
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | InternalServerError;

  @route("/{label_id}")
  namespace PerLabelForForm {
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
    @delete
    op DeleteLabelForForm(
      @path
      label_id: labelForFormId,
    ):
      | {
          ...NoContentResponse;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | InternalServerError;
  }
}
