model ResponsePeriod {
  start_at: utcDateTime;
  end_at: utcDateTime;
}

/**
 * 必要最低限の情報を含むフォーム
 *
 * 設定権限を持たないユーザーが必要な情報を取得するために使用することを想定
 */
model MinimalForm {
  id: uint32;
  title: string;
  description?: string;
  response_period: ResponsePeriod;
}

/**
 * PUBLIC: 全体公開
 * PRIVATE: 非公開
 */
enum Visibility {
  PUBLIC: "PUBLIC",
  PRIVATE: "PRIVATE",
}

/**
 * TEXT: 文章形式
 * MULTIPLE: 複数選択
 * SINGLE: 単一選択
 */
enum QuestionType {
  TEXT: "TEXT",
  SINGLE: "SINGLE",
  MULTIPLE: "MULTIPLE",
}

model Question {
  id: uint32;
  title: string;
  description: string;
  question_type: QuestionType;
  choices: string[];
  is_required: boolean;
}

model Form {
  id: uint32;
  title: string;
  description?: string;
  settings: {
    response_period: ResponsePeriod;

    /**
     * フォームに関する何らかのアクションが行われたときに通知を行うURL
     */
    webhook_url: url;

    default_title: string;
    visibility: Visibility;
  };
  metadata: {
    created_at: utcDateTime;
    updated_at: utcDateTime;
  };
  questions: Question[];
}

model RealAnswer {
  @visibility("read")
  question_id: uint32;

  answer: string;
}

model Answer {
  @visibility("read")
  id: uint32;

  user: User;
  form_id: uint32;
  timestamp: utcDateTime;
  title: string;
  answers: RealAnswer[];
  comments: {
    content: string;
    timestamp: utcDateTime;
    commented_by: User;
  }[];
}

model Label {
  @visibility("read")
  id: uint32;

  name: string;
}
