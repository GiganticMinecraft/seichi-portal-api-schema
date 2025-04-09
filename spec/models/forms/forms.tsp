import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Forms.Models {
  @minLength(1)
  scalar formTitle extends string;

  @minLength(1)
  scalar formDescription extends string;

  @format("url")
  scalar webhookUrl extends url;

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
  scalar defaultAnswerTitle extends string;

  model AnswerSettings {
    default_answer_title: defaultAnswerTitle;
    visibility: AnswerVisibility;
    response_period: ResponsePeriod;
  }

  model FormSettings {
    webhook_url?: webhookUrl;
    visibility: FormVisibility;
    answer_settings: AnswerSettings;
  }

  scalar formId extends uuid;

  model Form {
    @key
    @visibility(Lifecycle.Read)
    id: formId;

    @visibility(Lifecycle.Create, Lifecycle.Read, Lifecycle.Update)
    title: formTitle;

    @visibility(Lifecycle.Create, Lifecycle.Read, Lifecycle.Update)
    description?: formDescription;

    @visibility(Lifecycle.Read, Lifecycle.Update)
    settings: FormSettings;
  }
}
