import "@typespec/http";
import "../../models/forms/messages.tsp";
import "../../models/forms/forms.tsp";
import "../../models/forms/answers.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("Messages")
@route("/forms/{form_id}/answers/{answer_id}/messages")
namespace Messages.Router {
  using Messages.Models;
  using Forms.Models;
  using Answers.Models;

  @summary("メッセージの作成")
  @post
  op CreateMessage(
    @path form_id: formId,
    @path answer_id: answerId,
    @body body: Message,
  ):
    | {
        ...OkResponse;
        @body body: Message;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @summary("メッセージの取得")
  @get
  op ListMessage(@path form_id: formId, @path answer_id: answerId):
    | {
        ...OkResponse;
        @body body: {
          messages: Message[];
        };
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @route("/{message_id}")
  namespace PerMessage {
    @summary("メッセージの編集")
    @patch
    op UpdateMessage(
      @path
      form_id: formId,

      @path
      answer_id: answerId,

      @path
      message_id: messageId,

      @body body: MergePatchUpdate<Message>,
    ):
      | {
          ...OkResponse;
          @body body: Message;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | UnprocessableEntity
      | InternalServerError;

    @summary("メッセージの削除")
    @delete
    op DeleteMessage(
      @path
      form_id: formId,

      @path
      answer_id: answerId,

      @path
      message_id: messageId,
    ):
      | {
          ...OkResponse;
        }
      | BadRequest
      | Unauthorized
      | Forbidden
      | NotFound
      | InternalServerError;
  }
}
