import "@typespec/http";
import "../../models/forms/answers.tsp";
import "../../interfaces/needs-authorization-templates.tsp";
import "../../models/forms/label_for_form.tsp";

using TypeSpec.Http;

@service
namespace SeichiPortalApiSchema;

@tag("LabelForForm")
@route("/labels/forms")
namespace LabelForForm.Router {
  using LabelForForm.Models;

  alias LabelForFormRouter = NeedsAuthorizationTemplates<LabelForForm>;

  op CreateLabelForForm is LabelForFormRouter.create<{}>;

  op ListLabelForForm is LabelForFormRouter.list<{}>;

  @route("/{label_id}")
  namespace PerLabelForForm {
    op GetLabelForForm is LabelForFormRouter.get<{
      @path
      label_id: labelForFormId;
    }>;

    op UpdateLabelForForm is LabelForFormRouter.update<{
      @path
      label_id: labelForFormId;
    }>;

    op DeleteLabelForForm is LabelForFormRouter.delete<{
      @path
      label_id: labelForFormId;
    }>;
  }
}
