import "./types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Users.Models {
  using Types;

  enum Role {
    standardUser: "STANDARD_USER",
    administrator: "ADMINISTRATOR",
  }

  @minLength(1)
  scalar userName extends string;

  scalar userId extends uuid;

  model User {
    uuid: userId;
    name: userName;
    role: Role;
  }
}
