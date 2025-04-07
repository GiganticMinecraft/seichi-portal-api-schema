@friendlyName("{name}Id", T)
@format("uuid")
scalar ID<T> extends string;

alias OmitID<T> = OmitProperties<T, "id">;
