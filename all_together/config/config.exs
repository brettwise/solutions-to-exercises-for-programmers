# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :all_together,
  ecto_repos: [AllTogether.Repo]

# Configures the endpoint
config :all_together, AllTogether.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "1h4C9Xtu2c26w3lVPT7HsTooCQ2AXm56tEMzcJqbNgrM1Pe3EGsReN0/WAAcQzg+",
  render_errors: [view: AllTogether.ErrorView, accepts: ~w(html json)],
  pubsub: [name: AllTogether.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
