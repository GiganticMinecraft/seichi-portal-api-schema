import "../models/users.tsp";
import "../models/errors.tsp";

namespace VisibilityApplier {
  using Reflection;
  using SeichiPortalApiSchema.Users.Models;

  @withVisibilityFilter(#{ any: #[Role.standardUser] }, "{name}ForStandardUser")
  model ForStandardUser<Data extends Model> {
    ...Data;
  }

  @withVisibilityFilter(
    #{ any: #[Role.administrator] },
    "{name}ForAdministrator"
  )
  model ForAdministrator<Data extends Model> {
    ...Data;
  }

  alias VisibilityAppliiedModel<Data extends Model> = {
    forAdministratorModel: ForAdministrator<Data>;
    forStandardUserModel: ForStandardUser<Data>;
  };
}
