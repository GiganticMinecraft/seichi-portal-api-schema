enum ErrorCode {
  FORM_NOT_FOUND,
  ANSWER_NOT_FOUND,
  MESSAGE_NOT_FOUND,
  OUT_OF_PERIOD,
  DO_NOT_HAVE_PERMISSION_TO_POST_FORM_COMMENT,
  DO_NOT_HAVE_PERMISSION_TO_GET_ANSWERS,
  INTERNAL_SERVER_ERROR,
}

model Error {
  errorCode: ErrorCode;
  reason: string;
}
