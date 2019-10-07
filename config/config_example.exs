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


config :ff_already_played_together,
  servers_list: [
    {"Adamantoise", "NA"},
    {"Aegis", "JP"},
    {"Alexander", "JP"},
    {"Anima", "JP"},
    {"Asura", "JP"},
    {"Atomos", "JP"},
    {"Bahamut", "JP"},
    {"Balmung", "NA"},
    {"Behemoth", "NA"},
    {"Belias", "JP"},
    {"Brynhildr", "NA"},
    {"Cactuar", "NA"},
    {"Carbuncle", "JP"},
    {"Cerberus", "EU"},
    {"Chocobo", "JP"},
    {"Coeurl", "NA"},
    {"Diabolos", "NA"},
    {"Durandal", "JP"},
    {"Excalibur", "NA"},
    {"Exodus", "NA"},
    {"Faerie", "NA"},
    {"Famfrit", "NA"},
    {"Fenrir", "JP"},
    {"Garuda", "JP"},
    {"Gilgamesh", "NA"},
    {"Goblin", "NA"},
    {"Gungnir", "JP"},
    {"Hades", "JP"},
    {"Hyperion", "NA"},
    {"Ifrit", "JP"},
    {"Ixion", "JP"},
    {"Jenova", "NA"},
    {"Kujata", "JP"},
    {"Lamia", "NA"},
    {"Leviathan", "NA"},
    {"Lich", "EU"},
    {"Louisoix", "EU"},
    {"Malboro", "NA"},
    {"Mandragora", "JP"},
    {"Masamune", "JP"},
    {"Mateus", "NA"},
    {"Midgardsormr", "NA"},
    {"Moogle", "EU"},
    {"Odin", "EU"},
    {"Omega", "EU"},
    {"Pandaemonium", "JP"},
    {"Phoenix", "EU"},
    {"Ragnarok", "EU"},
    {"Ramuh", "JP"},
    {"Ridill", "JP"},
    {"Sargatanas", "NA"},
    {"Shinryu", "JP"},
    {"Shiva", "EU"},
    {"Siren", "NA"},
    {"Spriggan", "EU"},
    {"Tiamat", "JP"},
    {"Titan", "JP"},
    {"Tonberry", "JP"},
    {"Twintania", "EU"},
    {"Typhon", "JP"},
    {"Ultima", "JP"},
    {"Ultros", "NA"},
    {"Unicorn", "JP"},
    {"Valefor", "JP"},
    {"Yojimbo", "JP"},
    {"Zalera", "NA"},
    {"Zeromus", "JP"},
    {"Zodiark", "EU"}
  ]
