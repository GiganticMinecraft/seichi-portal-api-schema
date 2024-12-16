enum NotificationSource {
  FormMessage,
}

model NotificationSourceInfo {
  source: NotificationSource;
  url: string;
}

@format("uuid")
scalar NotificationId extends string;

model Notification {
  @visibility("read")
  id: NotificationId;

  source: NotificationSourceInfo;
  title: string;
  is_read: boolean;
}
