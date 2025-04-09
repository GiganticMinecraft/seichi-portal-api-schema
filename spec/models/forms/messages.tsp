import "../types/id.tsp";
import "../users.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Messages.Models {
  using Types;
  using Users.Models;

  scalar messageId extends uuid;
  scalar messageBody extends string;

  model Message {
    @key
    @visibility(Lifecycle.Read)
    id: messageId;

    @visibility(Lifecycle.Read)
    sender: User;

    body: messageBody;

    @visibility(Lifecycle.Read)
    timestamp: utcDateTime;
  }
}
