import "@typespec/http";
import "../models/notifications.tsp";
import "../interfaces/needs-authorization-templates.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/notifications")
@tag("Notifications")
namespace Notifications.Router {
  @route("/settings")
  namespace NotificationSettings {
    using Notifications.Models;
    alias NotificationSettingsRouter = NeedsAuthorizationTemplates<NotificationSettings>;

    @summary("通知設定の取得")
    op GetNotificationSettings is NotificationSettingsRouter.get<{}>;

    @summary("通知設定の更新")
    op UpdateNotificationSettings is NotificationSettingsRouter.update<{}>;
  }
}
