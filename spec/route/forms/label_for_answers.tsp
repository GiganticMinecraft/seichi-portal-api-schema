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

  alias LabelForAnswersRouter = NeedsAuthorizationTemplates<LabelForAnswers>;

  @summary("回答用ラベルを作成する")
  op CreateLabelForAnswers is LabelForAnswersRouter.create<{}>;

  @summary("回答用ラベルの一覧を取得する")
  op ListLabelForAnswers is LabelForAnswersRouter.list<{}>;

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
    op DeleteLabelForAnswers is LabelForAnswersRouter.delete<{
      @path
      label_id: labelForAnswersId;
    }>;
  }
}
