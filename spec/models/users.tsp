@service
namespace SeichiPortalApiSchema;

namespace Users.Models {
  enum Role {
    StandardUser: "STANDARD_USER",
    Administrator: "ADMINISTRATOR",
  }

  @minLength(1)
  scalar userName extends string;

  scalar userId extends id;

  model User {
    uuid: userId;
    name: userName;
    role: Role;
  }
}
