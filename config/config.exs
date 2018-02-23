# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :bookmark_api,
  ecto_repos: [BookmarkApi.Repo]

# Configures the endpoint
config :bookmark_api, BookmarkApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "B0QfQrrMHCHrlFITkqL/b0B0H0gCj2pIF5REaAfAjnu0nZ/BEqfiD54uA7OqYoIf",
  render_errors: [view: BookmarkApi.ErrorView, accepts: ~w(json)],
  pubsub: [name: BookmarkApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
