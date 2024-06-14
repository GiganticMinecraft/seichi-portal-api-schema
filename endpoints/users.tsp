import "@typespec/http";
import "@typespec/rest";
import "../models/errors.tsp";
import "../models/user.tsp";

using TypeSpec.Http;
using TypeSpec.Rest;

namespace SeichiPortalApiSchema;

@tag("Users")
@route("/users")
namespace Users {
  @get
  @summary("自身のユーザー情報の取得")
  op get(): {
    @statusCode statusCode: 200;
    @body body: User;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };
  
  @patch
  @summary("ユーザー情報を更新する")
  @route("/{uuid}")
  op update(
    @path uuid: string;
    @query role: Role;
  ): {
    @statusCode statusCode: 200;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };
  
  @get
  @summary("ユーザー一覧の取得")
  @route("/list")
  op list(): {
    @statusCode statusCode: 200;
    @body body: User[];
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };
}
