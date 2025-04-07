import "@typespec/rest";
import "@typespec/http";
import "../models/error.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;

interface NeedsAuthorizationTemplates<T> {
  @post
  create<AdditionalParams>(
    @header
    contentType: "application/json",

    @body body: T,
    ...AdditionalParams,
  ): {
    @statusCode statusCode: 201;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
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
    contentType: "application/json",

    @body body: T,
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
}
