import "@typespec/http";
import "../../models/forms/answers.tsp";
import "../../interfaces/needs-authorization-templates.tsp";
import "../../models/forms/label_for_answers.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("LabelForAnswers")
@route("/labels/answers")
namespace LabelForAnswers.Router {
  using LabelForAnswers.Models;

  @summary("回答用ラベルを作成する")
  @post
  op CreateLabelForAnswers(@body body: LabelForAnswers):
    | {
        ...CreatedResponse;
        ...LocationHeader;
        @body body: LabelForAnswers;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | UnprocessableEntity
    | InternalServerError;

  @summary("回答用ラベルの一覧を取得する")
  @get
  op ListLabelForAnswers():
    | {
        ...OkResponse;
        @body body: LabelForAnswers[];
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | InternalServerError;

  @route("/{label_id}")
  namespace PerLabelForAnswers {
    @summary("回答用ラベルを更新する")
    @patch
    op UpdateLabelForAnswers(
      @path
      label_id: labelForAnswersId,

      @body body: MergePatchUpdate<LabelForAnswers>,
    ):
      | {
          ...OkResponse;
          @body body: LabelForAnswers;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @summary("回答用ラベルを削除する")
    @delete
    op DeleteLabelForAnswers(
      @path
      label_id: labelForAnswersId,
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
