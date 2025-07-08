import "@typespec/http";
import "../models/errors.tsp";

using TypeSpec.Http;
using TypeSpec.Reflection;

interface NeedsAuthorizationTemplates<T extends Model> {
  @post
  create<AdditionalParams>(
    @header
    contentType: "application/json",

    @body body: T,
    ...AdditionalParams,
  ): {
    @statusCode statusCode: 201;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 422 | 500;
    @body body: Error;
  };

  @post
  createWithAdditionalResponseParams<
    AdditionalRequestParams,
    AdditionalResponseParams
  >(
    @header
    contentType: "application/json",

    @body body: T,
    ...AdditionalRequestParams,
  ): {
    @statusCode statusCode: 201;
    ...AdditionalResponseParams;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 422 | 500;
    @body body: Error;
  };

  @get
  get<AdditionalParams>(...AdditionalParams): {
    @statusCode statusCode: 200;
    @body body: T;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @get
  list<AdditionalParams>(...AdditionalParams): {
    @statusCode statusCode: 200;
    @body body: T[];
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @patch
  update<AdditionalParams>(
    @header
    contentType: "application/merge-patch+json",

    @body body: MergePatchUpdate<T>,
    ...AdditionalParams,
  ): {
    @statusCode statusCode: 200;
    @body body: T;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @delete
  delete<AdditionalParams>(...AdditionalParams): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @delete
  deleteWithAdditionalResponseParams<
    AdditionalRequestParams,
    AdditionalResponseParams
  >(...AdditionalRequestParams): {
    @statusCode statusCode: 204;
    ...AdditionalResponseParams;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };
}
