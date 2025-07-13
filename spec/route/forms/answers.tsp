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
    @post
    op CreateAnswer(
      @path
      form_id: formId,

      @body body: AnswerEntry,
    ):
      | {
          ...OkResponse;
          @body body: AnswerEntry;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @summary("回答の一覧取得")
    @get
    op ListAnswer(
      @path
      form_id: formId,
    ):
      | {
          ...OkResponse;
          @body body: AnswerEntry[];
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @route("/{answer_id}")
    @summary("回答の取得")
    @get
    op GetAnswer(
      @path
      form_id: formId,

      @path
      answer_id: answerId,
    ):
      | {
          ...OkResponse;
          @body body: AnswerEntry;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @route("/{answer_id}")
    @summary("回答の更新")
    @patch
    op UpdateAnswer(
      @path
      form_id: formId,

      @path
      answer_id: answerId,

      @body body: MergePatchUpdate<AnswerEntry>,
    ):
      | {
          ...OkResponse;
          @body body: AnswerEntry;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;
  }
}
