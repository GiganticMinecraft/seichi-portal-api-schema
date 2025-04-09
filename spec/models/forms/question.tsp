import "../id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Questions.Models {
  scalar QuestionId extends ID;

  enum QuestionType {
    Text: "TEXT",
    Single: "SINGLE",
    Multiple: "MULTIPLE",
  }

  @minLength(1)
  scalar QuestionTitle extends string;

  @minLength(1)
  scalar QuestionDescription extends string;

  model Question {
    @key
    @visibility(Lifecycle.Read)
    id: QuestionId;

    title: QuestionTitle;
    description: QuestionDescription;
    question_type: QuestionType;
    choices: string[];
    is_required: boolean;
  }
}
