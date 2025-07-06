import "@typespec/http";
import "../../interfaces/needs-authorization-templates.tsp";
import "../../models/forms/comments.tsp";
import "../../models/forms/forms.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("Comments")
@route("/forms/{form_id}/answers/{answer_id}/comments")
namespace Comments.Router {
  using Comments.Models;
  using Forms.Models;
  using Answers.Models;

  alias CommentRouter = NeedsAuthorizationTemplates<Comment>;

  @summary("コメントの作成")
  op CreateComment is CommentRouter.create<{
    @path
    form_id: formId;

    @path
    answer_id: answerId;
  }>;

  @summary("コメントの取得")
  op ListComment is CommentRouter.list<{
    @path
    form_id: formId;

    @path
    answer_id: answerId;
  }>;

  @route("/{comment_id}")
  namespace PerComment {
    @summary("コメントの編集")
    op UpdateComment is CommentRouter.update<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;

      @path
      comment_id: commentId;
    }>;

    @summary("コメントの削除")
    op DeleteComment is CommentRouter.delete<{
      @path
      form_id: formId;

      @path
      answer_id: answerId;

      @path
      comment_id: commentId;
    }>;
  }
}
