import "@typespec/rest";
import "@typespec/http";
import "../models/error.tsp";

using TypeSpec.Rest;
using TypeSpec.Http;

interface NeedsAuthorizationTemplates<T> {
  @post
  create(
    @header
    contentType: "application/json",

    @body body: T,
  ): {
    @statusCode statusCode: 201;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @get
  get(
    @path
    id: ID,
  ): {
    @statusCode statusCode: 200;
    @body body: T;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @get
  list(
    @query
    page?: int32,

    @query
    limit?: int32,
  ): {
    @statusCode statusCode: 200;
    @body body: T[];
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @patch
  update(
    @header
    contentType: "application/json",

    @path id: ID,
    @body body: T,
  ): {
    @statusCode statusCode: 200;
    @body body: T;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @delete
  delete(
    @header
    contentType: "application/json",

    @query
    id: ID,
  ): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };
}
