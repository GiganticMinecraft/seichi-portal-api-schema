import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace LabelForForm.Models {
  using Types;

  scalar labelForFormId extends uuid;

  @minLength(1)
  scalar labelNameForForm extends string;

  model LabelForForm {
    @key
    @visibility(Lifecycle.Read)
    id: labelForFormId;

    name: labelNameForForm;
  }
}
