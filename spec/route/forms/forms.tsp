import "@typespec/http";
import "../../models/forms/forms.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@route("/forms")
@tag("Forms")
namespace Forms.Route {
  using Forms.Models;

  @summary("フォームの作成")
  @post
  op CreateForm(@body body: Form):
    | {
        ...CreatedResponse;
        ...LocationHeader;
        @body body: Form;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | UnprocessableEntity
    | InternalServerError;

  @summary("フォームの一覧取得")
  @get
  op ListForm():
    | {
        ...OkResponse;
        @body body: Form[];
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | InternalServerError;

  @route("/{id}")
  @summary("フォームの取得")
  @get
  op GetForm(
    @path
    id: formId,
  ):
    | {
        ...OkResponse;
        @body body: Form;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | InternalServerError;

  @route("/{id}")
  @summary("フォームの更新")
  @patch
  op UpdateForm(
    @path
    id: formId,

    @body body: MergePatchUpdate<Form>,
  ):
    | {
        ...OkResponse;
        @body body: Form;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | UnprocessableEntity
    | InternalServerError;

  @route("/{id}")
  @summary("フォームの削除")
  @delete
  op DeleteForm(
    @path
    id: formId,
  ):
    | {
        ...NoContentResponse;
      }
    | BadRequest
    | Unauthorized
    | Forbidden
    | NotFound
    | InternalServerError;
}
