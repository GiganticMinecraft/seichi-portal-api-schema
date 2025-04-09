@service
namespace SeichiPortalApiSchema;

namespace External.Models {
  scalar discordOAuthToken extends string;

  model DiscordOAuthToken {
    token: discordOAuthToken;
  }
}
