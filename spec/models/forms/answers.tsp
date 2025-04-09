import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Answers.Models {
  using Users.Models;
  using Forms.Models;
  using Questions.Models;
  using Types;

  scalar AnswerId extends uuid;

  model Answer {
    question_id: questionId;
    answer: string;
  }

  model AnswerEntry {
    @key
    @visibility(Lifecycle.Read)
    id: AnswerId;

    form_id: formId;
    contents: Answer[];

    @visibility(Lifecycle.Read)
    user: User;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
