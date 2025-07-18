import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Questions.Models {
  // NOTE: TypeSpec の int32 は、 OpenAPI の integer + format: int32 に対応しているが、
  //    テストツールの Schemathesis では int32 の範囲外の値を許容してしまうバグがあり、
  //    それに対応するために明示的に int32 の範囲を指定している。
  //    ref: https://github.com/schemathesis/schemathesis/issues/593
  @minValue(0)
  @maxValue(2147483647)
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
