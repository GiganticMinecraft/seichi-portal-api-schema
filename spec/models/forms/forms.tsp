import "../types/id.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Forms.Models {
  using Types;
  using Users.Models;

  @minLength(1)
  scalar formTitle extends string;

  @minLength(1)
  scalar formDescription extends string;

  @format("url")
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
    @visibility(Role.standardUser, Role.administrator)
    start_at?: utcDateTime;

    @visibility(Role.standardUser, Role.administrator)
    end_at?: utcDateTime;
  }

  /**
   * 回答送信時にデフォルト値として設定されるタイトルを指定することができます。
   * また、$question_id や $username を指定することで、
   * 該当の質問に対する回答内容や回答者名を埋め込むことができます。
   */
  @minLength(1)
  scalar defaultAnswerTitle extends string;

  model AnswerSettings {
    default_answer_title?: defaultAnswerTitle;
    visibility: AnswerVisibility;

    @visibility(Role.standardUser, Role.administrator)
    response_period: ResponsePeriod;
  }

  model FormSettings {
    webhook_url?: webhookUrl;

    @visibility(Users.Models.Role.standardUser, Users.Models.Role.administrator)
    visibility: FormVisibility;

    @visibility(Users.Models.Role.standardUser, Users.Models.Role.administrator)
    answer_settings: AnswerSettings;
  }

  scalar formId extends uuid;

  model Form {
    @key
    @visibility(Lifecycle.Read, Role.standardUser, Role.administrator)
    id: formId;

    @visibility(
      Lifecycle.Create,
      Lifecycle.Read,
      Lifecycle.Update,
      Role.standardUser,
      Role.administrator
    )
    title: formTitle;

    @visibility(
      Lifecycle.Create,
      Lifecycle.Read,
      Lifecycle.Update,
      Role.standardUser,
      Role.administrator
    )
    description?: formDescription;

    @visibility(
      Lifecycle.Read,
      Lifecycle.Update,
      Role.standardUser,
      Role.administrator
    )
    settings: FormSettings;
  }
}
