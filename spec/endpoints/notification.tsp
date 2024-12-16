import "@typespec/http";
import "@typespec/rest";
import "../models/errors.tsp";
import "../models/notification.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

@service
namespace SeichiPortalApiSchema;

@tag("Notifications")
@route("/notifications")
namespace Notifications {
  @get
  @summary("通知一覧を返す")
  op notifications(): {
    @statusCode statusCode: 200;
    @body body: Notification[];
  } | {
    @statusCode statusCode: 401 | 403 | 500;
    @body body: Error;
  };

  @post
  @summary("すべて既読にする")
  op readAll(): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 401 | 403 | 500;
    @body body: Error;
  };

  @post
  @summary("通知を既読にする")
  @route("/{id}")
  op read(@path id: NotificationId): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 401 | 403 | 404 | 500;
    @body body: Error;
  };
}
