import "@typespec/http";

using TypeSpec.Http;

@error
model Error {
  errorCode: string;
  reason: string;
}

@error
model BadRequest {
  ...BadRequestResponse;
  @body error: Error;
}

@error
model Unauthorized {
  ...UnauthorizedResponse;
  @body error: Error;
}

@error
model Forbidden {
  ...ForbiddenResponse;
  @body error: Error;
}

@error
model NotFound {
  ...NotFoundResponse;
  @body error: Error;
}

@error
model UnprocessableEntity {
  ...Response<422>;
  @body error: Error;
}

@error
model InternalServerError {
  ...Response<500>;
  @body error: Error;
}
