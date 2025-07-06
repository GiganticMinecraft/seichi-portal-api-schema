import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace LabelForAnswers.Models {
  using Types;

  scalar labelForAnswersId extends uuid;

  @minLength(1)
  scalar labelNameForAnswers extends string;

  model LabelForAnswers {
    @key
    @visibility(Lifecycle.Read)
    id: labelForAnswersId;

    name: labelNameForAnswers;
  }
}
