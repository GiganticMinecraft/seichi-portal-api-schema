import "@typespec/http";

using TypeSpec.Http;

// TODO: ID に指定するデータ型を string 以外にもできる仕組みが必要
scalar ID<T> extends string;
