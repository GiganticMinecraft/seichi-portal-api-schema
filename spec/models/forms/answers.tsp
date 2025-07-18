import "../types/id.tsp";
import "./questions.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Answers.Models {
  using Users.Models;
  using Questions.Models;
  using Types;

  scalar answerId extends uuid;

  model Answer {
    question_id: questionId;
    answer: string;
  }

  model AnswerEntry {
    @key
    @visibility(Lifecycle.Read)
    id: answerId;

    contents: Answer[];

    @visibility(Lifecycle.Read)
    user: User;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
