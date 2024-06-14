enum ErrorCode {
  FORM_NOT_FOUND,
  OUT_OF_PERIOD,
  DO_NOT_HAVE_PERMISSION_TO_POST_FORM_COMMENT,
  INTERNAL_SERVER_ERROR
}

model Error {
  errorCode: ErrorCode;
  reason: string;
}
