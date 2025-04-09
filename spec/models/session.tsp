import "./types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Session.Models {
  model SessionExpires {
    @visibility(Lifecycle.Create)
    expires: int32;
  }
}
