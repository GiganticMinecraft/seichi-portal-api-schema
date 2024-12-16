import "../endpoints/users.tsp";

model Message {
  @visibility("read")
  @format("uuid")
  id: string;

  body: string;
  sender: User;
  timestamp: utcDateTime;
}
