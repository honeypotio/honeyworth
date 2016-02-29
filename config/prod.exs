use Mix.Config

config :honeyworth, Honeyworth.Endpoint,
  http: [port: {:system, "PORT"}],
  url: [host: "example.com", port: 80],
  cache_static_manifest: "priv/static/manifest.json"

# Do not print debug messages in production
config :logger, level: :info

config :logger,
  backends: [Rollbax.Notifier]

config :logger, Rollbax.Notifier,
  level: :error

config :honeyworth, Honeyworth.Endpoint,
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Configure your database
config :honeyworth, Honeyworth.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: System.get_env("DATABASE_URL"),
  pool_size: 20

