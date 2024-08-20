import "@typespec/http";
import "@typespec/rest";
import "../models/errors.tsp";
import "../models/user.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace SeichiPortalApiSchema;

@tag("Sessions")
@route("/session")
namespace Session {
  @post
  @summary("セッションを開始する")
  op create(): {
    @statusCode statusCode: 200;

    /**
     * `SEICHI_PORTAL__SESSION_ID` という名前の Cookie に30分間有効なセッション ID を設定します。
     */
    @header SetCookie: string;
  } | {
    @statusCode statusCode: 401 | 500;
    @body body: Error;
  };

  @delete
  @summary("セッションを終了する")
  op delete(): {
    @statusCode statusCode: 200;

    /**
     * `SEICHI_PORTAL__SESSION_ID` という名前の Cookie に30分間有効なセッション ID を削除します。
     */
    @header SetCookie: string;
  } | {
    @statusCode statusCode: 401 | 500;
    @body body: Error;
  };
}
