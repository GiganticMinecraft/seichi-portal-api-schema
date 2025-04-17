import "../models/users.tsp";

namespace VisibilityApplier {
  using Reflection;
  using Users.Models;

  @withVisibilityFilter(#{ any: #[Role.standardUser] })
  model ForStandardUser<Data extends Model> {
    ...Data;
  }

  @withVisibilityFilter(#{ any: #[Role.administrator] })
  model ForAdministrator<Data extends Model> {
    ...Data;
  }

  alias VisibilityAppliiedModel<Data extends Model> = ForAdministrator<Data> | ForStandardUser<Data>;
}
