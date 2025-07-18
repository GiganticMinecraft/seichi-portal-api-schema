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

  @summary("質問の一覧取得")
  @get
  op ListQuestion(
    @path
    form_id: formId,
  ):
    | {
        ...OkResponse;
        @body body: Question[];
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | InternalServerError;

  @summary("質問の上書き")
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
