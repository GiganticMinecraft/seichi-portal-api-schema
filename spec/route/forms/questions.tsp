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

  @summary("質問の更新")
  @put
  op UpdateQuestion(
    @path
    form_id: formId,
  ):
    | {
        ...OkResponse;
        @body body: {
          questions: Question[];
        };
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;
}
