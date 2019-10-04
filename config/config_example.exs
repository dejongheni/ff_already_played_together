# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

# Configures the endpoint
config :ff_already_played_together, FfAlreadyPlayedTogetherWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "your_key",
  render_errors: [view: FfAlreadyPlayedTogetherWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: FfAlreadyPlayedTogether.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "mix phx.gen.secret 32"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

config :fflogs_wrapper,
  token: "your_token",
  base_url: "https://www.fflogs.com:443/v1/"
