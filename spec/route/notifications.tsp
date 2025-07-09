import "@typespec/http";
import "../models/notifications.tsp";
import "../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/notifications/settings")
@tag("Notifications")
namespace Notifications.Router {
  using Users.Models;
  using Notifications.Models;

  @get
  @summary("通知の設定を取得する")
  @route("/{userId}")
  op GetNotificationSettings(@path userId: userId):
    | {
        ...OkResponse;
        @body body: NotificationSettings;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @route("/me")
  @summary("自身の通知設定の取得")
  op GetMyNotificationSettings():
    | {
        ...OkResponse;
        @bodyRoot body: NotificationSettings;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @route("/me")
  @summary("通知設定の更新")
  @patch
  op UpdateNotificationSettings(
    @body body: MergePatchUpdate<NotificationSettings>,
  ):
    | {
        ...OkResponse;
        @bodyRoot body: NotificationSettings;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;
}
