import "@typespec/http";
import "@typespec/rest";
import "../models/errors.tsp";
import "../models/user.tsp";
import "../models/message.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace SeichiPortalApiSchema;

@tag("Messages")
@route("/messages")
namespace Messages {
  @post
  @summary("メッセージの新規作成")
  op create(
    @header
    contentType: "application/json",

    @body body: {
      related_answer_id: uint32;
      body: string;
    },
  ): {
    @statusCode statusCode: 201;
    @body body: {
      id: uint32;
    };
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @get
  @route("/{related_answer_id}")
  @summary("メッセージの一覧取得")
  op list(
    @path
    related_answer_id: uint32,
  ): {
    @statusCode statusCode: 200;
    @body body: {
      messages: Message[];
    };
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @delete
  @route("/{message_id}")
  @summary("メッセージの削除")
  op delete(
    @path
    message_id: uint32,
  ): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };
}
