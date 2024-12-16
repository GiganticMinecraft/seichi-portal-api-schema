import "@typespec/http";
import "../../models/errors.tsp";
import "../types/id.tsp";

using TypeSpec.Http;

interface GeneralCRUD<T> {
  @post
  create(
    @header
    contentType: "application/json",

    @body body: {
      value: T;
    },
  ): {
    @statusCode statusCode: 201;
    @header Location: string;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  @get
  get(
    @header
    contentType: "application/json",

    @body body: {
      id: ID<T>;
    },
  ): {
    @statusCode statusCode: 200;
    @body body: T;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
    @body body: Error;
  };

  @get
  list(): {
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

    @body body: ID<T>,
  ): {
    @statusCode statusCode: 204;
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };
}
