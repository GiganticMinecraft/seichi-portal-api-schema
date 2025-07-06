import "../types/id.tsp";
import "../users.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Comments.Models {
  using Types;
  using Users.Models;

  scalar commentId extends uuid;

  @minLength(1)
  scalar commentContent extends string;

  model Comment {
    @key
    @visibility(Lifecycle.Read)
    id: commentId;

    content: commentContent;

    @visibility(Lifecycle.Read)
    commented_by: User;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
