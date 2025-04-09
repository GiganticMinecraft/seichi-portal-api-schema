import "@typespec/http";

import "./route/forms/forms.tsp";
import "./route/forms/questions.tsp";
import "./route/forms/answers.tsp";
import "./route/forms/comments.tsp";
import "./route/forms/messages.tsp";
import "./route/forms/label_for_answers.tsp";
import "./route/forms/label_for_form.tsp";
import "./route/user.tsp";
import "./route/search.tsp";
import "./route/session.tsp";

using TypeSpec.Http;

@service(#{ title: "Seichi Portal API" })
@server("http://localhost:9000", "開発環境")
@useAuth(BearerAuth)
namespace SeichiPortalApiSchema;
