import "@typespec/http";
import "../models/notifications.tsp";
import "../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/notifications")
@tag("Notifications")
namespace Notifications.Router {
  @route("/settings/me")
  namespace NotificationSettings {
    using Notifications.Models;
    alias NotificationSettingsRouter = NeedsAuthorizationTemplates<NotificationSettings>;

    @summary("通知設定の取得")
    op GetNotificationSettings is NotificationSettingsRouter.get<{}>;

    @summary("通知設定の更新")
    @patch
    op UpdateNotificationSettings(
      @header contentType: "application/merge-patch+json",
      @body body: MergePatchUpdate<NotificationSettings>,
    ):
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
  }
}
