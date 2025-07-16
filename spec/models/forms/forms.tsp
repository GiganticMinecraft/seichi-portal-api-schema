import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Forms.Models {
  using Types;

  @minLength(1)
  scalar formTitle extends string;

  @minLength(0)
  scalar formDescription extends string;

  @pattern("https://discord.com/api/webhooks/.*")
  scalar webhookUrl extends url;

  enum FormVisibility {
    public: "PUBLIC",
    private: "PRIVATE",
  }

  enum AnswerVisibility {
    public: "PUBLIC",
    private: "PRIVATE",
  }

  model ResponsePeriod {
    start_at: utcDateTime | null;
    end_at: utcDateTime | null;
  }

  /**
   * 回答送信時にデフォルト値として設定されるタイトルを指定することができます。
   * また、$question_id や $username を指定することで、
   * 該当の質問に対する回答内容や回答者名を埋め込むことができます。
   */
  @minLength(1)
  scalar defaultAnswerTitle extends string;

  model AnswerSettings {
    default_answer_title: defaultAnswerTitle | null;
    visibility: AnswerVisibility;
    response_period: ResponsePeriod | null;
  }

  model FormSettings {
    webhook_url?: webhookUrl | null;
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
    description: formDescription;

    @visibility(Lifecycle.Read, Lifecycle.Update)
    settings: FormSettings;
  }
}
