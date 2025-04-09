import "@typespec/http";
import "../../interfaces/needs-authorization-templates.tsp";
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

  alias MessageRouter = NeedsAuthorizationTemplates<Message>;

  @summary("メッセージの作成")
  op CreateMessage is MessageRouter.create<{
    @path
    form_id: formId;

    @path
    answer_id: answerId;
  }>;

  @summary("メッセージの取得")
  op ListMessage is MessageRouter.list<{
    @path
    form_id: formId;

    @path
    answer_id: answerId;
  }>;

  @route("/{message_id}")
  namespace PerMessage {
    @summary("メッセージの編集")
    op UpdateMessage is MessageRouter.update<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;

      @path
      message_id: messageId;
    }>;

    @summary("メッセージの削除")
    op DeleteMessage is MessageRouter.delete<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;

      @path
      message_id: messageId;
    }>;
  }
}
