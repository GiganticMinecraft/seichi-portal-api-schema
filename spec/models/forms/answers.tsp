import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Answers.Models {
  scalar AnswerId extends uuid;

  model Answer {
    question_id: Questions.Models.questionId;
    answer: string;
  }

  model AnswerEntry {
    @key
    @visibility(Lifecycle.Read)
    id: AnswerId;

    form_id: Forms.Models.formId;
    contents: Answer[];

    @visibility(Lifecycle.Read)
    user: Users.Models.User;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
