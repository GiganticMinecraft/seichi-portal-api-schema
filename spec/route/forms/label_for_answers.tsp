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
    @summary("回答用ラベルを取得する")
    op GetLabelForAnswers is LabelForAnswersRouter.get<{
      @path
      label_id: labelForAnswersId;
    }>;

    @summary("回答用ラベルを更新する")
    op UpdateLabelForAnswers is LabelForAnswersRouter.update<{
      @path
      label_id: labelForAnswersId;
    }>;

    @summary("回答用ラベルを削除する")
    op DeleteLabelForAnswers is LabelForAnswersRouter.delete<{
      @path
      label_id: labelForAnswersId;
    }>;
  }
}
