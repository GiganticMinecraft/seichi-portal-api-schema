import "../id.tsp";

@service
namespace SeichiPortalApiSchema;

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
