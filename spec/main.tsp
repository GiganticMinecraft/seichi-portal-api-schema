import "@typespec/http";

import "./route/forms.tsp";
import "./route/questions.tsp";
import "./route/answers.tsp";
import "./route/user.tsp";

using TypeSpec.Http;

@service(#{ title: "Seichi Portal API" })
@server("http://localhost:9000", "開発環境")
@useAuth(BearerAuth)
namespace SeichiPortalApiSchema;
