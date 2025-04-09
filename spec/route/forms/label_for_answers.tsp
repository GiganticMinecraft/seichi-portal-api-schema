import "@typespec/http";
import "../../models/forms/answers.tsp";
import "../../interfaces/needs-authorization-templates.tsp";
import "../../models/forms/label_for_answers.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("LabelForAnswers")
@route("/labels/answers")
namespace LabelForAnswers.Router {
  using LabelForAnswers.Models;

  alias LabelForAnswersRouter = NeedsAuthorizationTemplates<LabelForAnswers>;

  op CreateLabelForAnswers is LabelForAnswersRouter.create<{}>;

  op ListLabelForAnswers is LabelForAnswersRouter.list<{}>;

  op LabelListForAnswers is LabelForAnswersRouter.list<{}>;

  @route("/{label_id}")
  namespace PerLabelForAnswers {
    op GetLabelForAnswers is LabelForAnswersRouter.get<{
      @path
      label_id: labelForAnswersId;
    }>;

    op UpdateLabelForAnswers is LabelForAnswersRouter.update<{
      @path
      label_id: labelForAnswersId;
    }>;

    op DeleteLabelForAnswers is LabelForAnswersRouter.delete<{
      @path
      label_id: labelForAnswersId;
    }>;
  }
}
