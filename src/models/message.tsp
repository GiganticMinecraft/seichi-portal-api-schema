import "../endpoints/users.tsp";

model Message {
  body: string;
  sender: User;
  timestamp: utcDateTime;
}
