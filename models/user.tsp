enum Role {
  STANDARD_USER,
  ADMINISTRATOR,
}

model User {
  uuid: string;
  name: string;
  role: Role;
}
