import "./types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Session.Models {
  model SessionExpires {
    @visibility(Lifecycle.Create)
    // NOTE: TypeSpec の int32 は、 OpenAPI の integer + format: int32 に対応しているが、
    //    テストツールの Schemathesis では int32 の範囲外の値を許容してしまうバグがあり、
    //    それに対応するために明示的に int32 の範囲を指定している。
    //    ref: https://github.com/schemathesis/schemathesis/issues/593
    @minValue(0)
    @maxValue(4294967295)
    expires: int64;
  }
}
