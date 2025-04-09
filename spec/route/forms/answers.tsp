import "@typespec/http";
import "../../models/forms/answers.tsp";
import "../../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("Answers")
namespace Answers.Router {
  using Answers.Models;
  using Forms.Models;

  alias AnswerRouter = NeedsAuthorizationTemplates<AnswerEntry>;

  @route("/forms/answers")
  namespace AllAnswers {
    @summary("すべての回答をフォームを横断して取得")
    op ListAllAnswers is AnswerRouter.list<{}>;
  }

  @route("/forms/{form_id}/answers")
  namespace PerForm {
    @summary("回答の作成")
    op CreateAnswer is AnswerRouter.create<{
      @path
      form_id: formId;
    }>;

    @summary("回答の一覧取得")
    op ListAnswer is AnswerRouter.list<{
      @path
      form_id: formId;
    }>;

    @route("/{answer_id}")
    @summary("回答の取得")
    op GetAnswer is AnswerRouter.get<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;
    }>;

    @route("/{answer_id}")
    @summary("回答の更新")
    op UpdateAnswer is AnswerRouter.update<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;
    }>;
  }
}
