import "./id.tsp";
import "@typespec/http";
import "@typespec/rest";

@service
namespace SeichiPortalApiSchema;

using TypeSpec.Http;
using TypeSpec.Rest;

namespace Forms.Models {
  @minLength(1)
  scalar FormTitle extends string;

  @minLength(1)
  scalar FormDescription extends string;

  @format("url")
  scalar WebhookUrl extends url;

  enum FormVisibility {
    Public: "PUBLIC",
    Private: "PRIVATE",
  }

  enum AnswerVisibility {
    Public: "PUBLIC",
    Private: "PRIVATE",
  }

  model ResponsePeriod {
    start_at?: utcDateTime;
    end_at?: utcDateTime;
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
    id: ID;

    @visibility(Lifecycle.Create, Lifecycle.Read, Lifecycle.Update)
    title: FormTitle;

    @visibility(Lifecycle.Create, Lifecycle.Read, Lifecycle.Update)
    description?: FormDescription;

    @visibility(Lifecycle.Read, Lifecycle.Update)
    settings: FormSettings;
  }
}
