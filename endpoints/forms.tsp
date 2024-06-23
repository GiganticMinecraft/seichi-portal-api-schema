import "@typespec/http";
import "@typespec/rest";
import "../models/errors.tsp";
import "../models/form.tsp";

@service
namespace SeichiPortalApiSchema;

using TypeSpec.Http;
using TypeSpec.Rest;

@tag("Forms")
@route("/forms")
namespace Forms {
  /**
   * フォームを新しく作ります。
   *
   * 作られたフォームのIDがJSONとして返却され、作成されたフォームへのURLを含むHeaderが返されます。
   *
   */
  @post
  @summary("フォームの新規作成")
  op create(
    @header
    contentType: "application/json",

    @body body: {
      title: string;
      description?: string;
    },
  ): {
    @statusCode statusCode: 201;
    @header Location: string;
    @body body: {
      id: uint32;
    };
  } | {
    @statusCode statusCode: 400 | 401 | 403 | 500;
    @body body: Error;
  };

  /**
   * フォームの一覧を返す。
   *
   * このエンドポイントでは最小限のフォーム情報を含むリストが返されます。
   *
   * また、取得パラメータとしてlimitとoffsetを指定し、取得件数を絞り込むことができます。
   * レスポンス内容はid基準とし、昇順ソートしたものになります。
   * ※各フォームの詳細情報などは別APIを利用することを想定しています。
   */
  @get
  @summary("フォームの一覧取得")
  op list(
    @doc("取得件数の下限値 例えば、offsetを1とすると2件目からのデータが取得できます。")
    @minValue(0)
    @query
    offset?: uint32,

    @doc("取得件数の上限値 例えば、limitを10とすると10番目までのデータが取得できます。")
    @minValue(1)
    @query
    limit?: uint32,
  ): {
    @statusCode statusCode: 200;
    @body body: MinimalForm[];
  } | {
    @statusCode statusCode: 400 | 401 | 500;
    @body body: Error;
  };

  @route("/{formId}")
  namespace IndividualForm {
    @get
    @summary("フォームの詳細取得")
    op get(@path formId: uint32): {
      @statusCode statusCode: 200;
      @body body: Form;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @delete
    @summary("フォームの削除")
    op delete(@path formId: uint32): {
      @statusCode statusCode: 200;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    /**
     * フォームの設定値を変更するエンドポイント。
     * 回答可能期間を新たに設定する場合、start_atとend_atの両方を指定してください。
     */
    @patch
    @summary("フォームの値を更新する")
    op update(
      @path formId: uint32,
      @query title?: string,
      @query description?: string,
      @query start_at?: utcDateTime,
      @query end_at?: utcDateTime,
      @query webhook_url?: url,

      /**
       * 各回答に対して自動でつけられるタイトルを設定します。
       * `$[question_id]`と指定することで、`question_id`の質問の回答をタイトルに含めることができます。
       */
      @query default_answer_title?: string,

      @query visibility?: Visibility,
    ): {
      @statusCode statusCode: 200;
      @body body: Form;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @route("/questions")
    @summary("フォームの質問一覧取得")
    op listQuestions(@path formId: uint32): {
      @statusCode statusCode: 200;
      @body body: Question[];
    } | {
      @statusCode statusCode: 400 | 401 | 404 | 500;
      @body body: Error;
    };

    @route("/answers")
    @summary("フォームの回答一覧取得")
    op listAnswers(@path formId: uint32): {
      @statusCode statusCode: 200;
      @body body: Answer[];
    } | {
      @statusCode statusCode: 400 | 401 | 404 | 500;
      @body body: Error;
    };
  }

  @route("/questions")
  namespace Questions {
    @post
    @summary("質問の新規作成")
    op create(
      @header
      contentType: "application/json",

      @body body: {
        form_id: uint32;
        questions: Question[];
      },
    ): {
      @statusCode statusCode: 201;
      @body body: {
        id: uint32;
      };
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 500;
      @body body: Error;
    };

    @delete
    @summary("質問の削除")
    op delete(
      @body body: {
        question_id: uint32;
      },
    ): {
      @statusCode statusCode: 200;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @put
    @summary("質問の置き換え")
    op replace(
      @body body: {
        form_id: uint32;
        questions: Question[];
      },
    ): {
      @statusCode statusCode: 200;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }

  @route("/answers")
  namespace Answers {
    @get
    @summary("回答の取得")
    @route("/{answerId}")
    op get(@path answerId: uint32): {
      @statusCode statusCode: 200;
      @body body: Answer;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @get
    @summary("回答の一覧取得")
    op list(): {
      @statusCode statusCode: 200;
      @body body: Answer[];
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 500;
      @body body: Error;
    };

    @post
    @summary("指定されたフォームに回答を追加する")
    op create(
      @header
      contentType: "application/json",

      @body body: {
        form_id: uint32;
        answers: RealAnswer[];
      },
    ): {
      @statusCode statusCode: 201;
      @body body: {
        id: uint32;
      };
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 500;
      @body body: Error;
    };

    @route("/labels")
    namespace Labels {
      @post
      @summary("フォームの回答につけられるラベルを作成する")
      op createLabel(
        @header
        contentType: "application/json",

        @body body: Label,
      ): {
        @statusCode statusCode: 201;
      } | {
        @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
        @body body: Error;
      };

      @delete
      @summary("フォームの回答につけられるラベルを削除する")
      op deleteLabel(
        @body body: {
          id: uint32;
        },
      ): {
        @statusCode statusCode: 200;
      } | {
        @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
        @body body: Error;
      };
    }

    @route("/comment")
    namespace Comment {
      @post
      @summary("回答にコメントを追加する")
      op create(
        @header
        contentType: "application/json",

        @body body: {
          answer_id: uint32;
          content: string;
        },
      ): {
        @statusCode statusCode: 201;
      } | {
        @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
        @body body: Error;
      };

      @delete
      @summary("回答のコメントを削除する")
      op delete(
        @body body: {
          comment_id: uint32;
        },
      ): {
        @statusCode statusCode: 200;
      } | {
        @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
        @body body: Error;
      };

      @patch
      @summary("回答のコメントを更新する")
      op update(
        @body body: {
          comment_id: uint32;
          content: string;
        },
      ): {
        @statusCode statusCode: 200;
      } | {
        @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
        @body body: Error;
      };
    }
  }

  @route("/labels")
  namespace Labels {
    @post
    @summary("フォームにつけられるラベルを作成する")
    op create(
      @header
      contentType: "application/json",

      @body body: Label,
    ): {
      @statusCode statusCode: 201;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };

    @delete
    @summary("フォームにつけられるラベルを削除する")
    op delete(
      @body body: {
        id: uint32;
      },
    ): {
      @statusCode statusCode: 200;
    } | {
      @statusCode statusCode: 400 | 401 | 403 | 404 | 500;
      @body body: Error;
    };
  }
}
