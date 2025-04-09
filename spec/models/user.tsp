@service
namespace SeichiPortalApiSchema;

namespace Users.Models {
  enum Role {
    StandardUser: "STANDARD_USER",
    Administrator: "ADMINISTRATOR",
  }

  @minLength(1)
  scalar UserName extends string;

  scalar UserId extends ID;

  model User {
    uuid: UserId;
    name: UserName;
    role: Role;
  }
}
