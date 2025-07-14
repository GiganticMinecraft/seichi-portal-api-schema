import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Questions.Models {
  using Types;

  @minValue(0)
  scalar questionId extends int32;

  enum QuestionType {
    text: "TEXT",
    single: "SINGLE",
    multiple: "MULTIPLE",
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
