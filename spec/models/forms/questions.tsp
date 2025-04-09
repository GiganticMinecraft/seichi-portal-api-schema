import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Questions.Models {
  scalar questionId extends uuid;

  enum QuestionType {
    Text: "TEXT",
    Single: "SINGLE",
    Multiple: "MULTIPLE",
  }

  @minLength(1)
  scalar questionTitle extends string;

  @minLength(1)
  scalar questionDescription extends string;

  model Question {
    @key
    @visibility(Lifecycle.Read)
    id: questionId;

    title: questionTitle;
    description: questionDescription;
    question_type: QuestionType;
    choices: string[];
    is_required: boolean;
  }
}
