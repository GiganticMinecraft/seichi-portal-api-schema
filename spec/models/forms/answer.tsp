import "../id.tsp";
import "@typespec/http";
import "@typespec/rest";

@service
namespace SeichiPortalApiSchema;

using TypeSpec.Http;
using TypeSpec.Rest;

namespace Answers.Models {
  scalar AnswerId extends ID;

  model Answer {
    question_id: Questions.Models.QuestionId;
    answer: string;
  }

  model AnswerEntry {
    @key
    @visibility(Lifecycle.Read)
    id: AnswerId;

    form_id: Forms.Models.FormId;
    contents: Answer[];

    @visibility(Lifecycle.Read)
    user: Users.Models.User;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
