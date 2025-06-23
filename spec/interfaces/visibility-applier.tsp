import "../models/users.tsp";
import "../models/errors.tsp";

namespace VisibilityApplier {
  using Reflection;
  using SeichiPortalApiSchema.Users.Models;

  @friendlyName(NameTemplate, Data)
  @withVisibilityFilter(#{ any: #[Role.standardUser] }, NameTemplate)
  model ForStandardUser<
    Data extends Model,
    NameTemplate extends valueof string = "{name}ForStandardUser"
  > {
    ...Data;
  }

  @friendlyName(NameTemplate, Data)
  @withVisibilityFilter(#{ any: #[Role.administrator] }, NameTemplate)
  model ForAdministrator<
    Data extends Model,
    NameTemplate extends valueof string = "{name}ForAdministrator"
  > {
    ...Data;
  }

  alias VisibilityAppliiedModel<Data extends Model> = ForAdministrator<Data> | ForStandardUser<Data>;
}
