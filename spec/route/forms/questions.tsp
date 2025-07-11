import "@typespec/http";
import "../../models/forms/questions.tsp";
import "../../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/forms/{form_id}/questions")
@tag("Questions")
namespace Questions.Router {
  using Forms.Models;
  using Questions.Models;

  alias QuestionRouter = NeedsAuthorizationTemplates<Question>;

  @summary("質問の作成")
  op CreateQuestion is QuestionRouter.create<{
    @path
    form_id: formId;
  }>;

  @summary("質問の一覧取得")
  op ListQuestion is QuestionRouter.list<{
    @path
    form_id: formId;
  }>;

  @route("/{question_id}")
  @summary("質問の取得")
  op GetQuestion is QuestionRouter.get<{
    @path
    form_id: formId;

    @path
    question_id: questionId;
  }>;

  @route("/{question_id}")
  @summary("質問の更新")
  op UpdateQuestion is QuestionRouter.update<{
    @path
    form_id: formId;

    @path
    question_id: questionId;
  }>;

  @route("/{question_id}")
  @summary("質問の削除")
  op DeleteQuestion is QuestionRouter.delete<{
    @path
    form_id: formId;

    @path
    question_id: questionId;
  }>;
}
