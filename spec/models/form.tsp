import "./id.tsp";
import "@typespec/http";
import "@typespec/rest";

namespace Forms.Models;

using TypeSpec.Http;
using TypeSpec.Rest;

@minLength(1)
scalar FormTitle extends string;

@minLength(1)
scalar FormDescription extends string;

@format("url")
scalar WebhookUrl extends string;

enum FormVisibility {
  @description("公開")
  Public = "PUBLIC",
  @description("非公開")
  Private = "PRIVATE",
}

enum AnswerVisibility {
  @description("公開")
  Public = "PUBLIC",
  @description("非公開")
  Private = "PRIVATE",
}

model ResponsePeriod {
  start_at?: DateTime;
  end_at?: DateTime;
}

@minLength(1)
scalar DefaultAnswerTitle extends string;

model AnswerSettings {
  default_answer_title: DefaultAnswerTitle;
  visibility: AnswerVisibility;
  response_period: ResponsePeriod;
}

model FormSettings {
  webhook_url?: WebhookUrl;
  visibility: FormVisibility;
  answer_settings: AnswerSettings; 
}

model Form {
  @key
  @visibility(Lifecycle.Read)
  id: ID<Form>;

  @visibility(Lifecycle.Create)
  title: FormTitle;

  @visibility(Lifecycle.Create)
  description?: FormDescription;

  @visibility(Lifecycle.Read)
  settings: FormSettings;
}
