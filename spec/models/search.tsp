import "./types/id.tsp";
import "./forms/forms.tsp";
import "./forms/answers.tsp";
import "./forms/label_for_answers.tsp";
import "./forms/label_for_form.tsp";
import "./forms/comments.tsp";
import "./users.tsp";

@service
namespace SeichiPortalApiSchema;

namespace Search.Models {
  model CrossSearchResult {
    forms: Forms.Models.Form[];
    users: Users.Models.User[];
    answers: Answers.Models.Answer[];
    comments: Comments.Models.Comment[];
    label_for_forms: LabelForForm.Models.LabelForForm[];
    label_for_answers: LabelForAnswers.Models.LabelForAnswers[];
  }
}
