use Mix.Config

# In this file, we keep production configuration that
# you likely want to automate and keep it away from
# your version control system.
config :honeyworth, Honeyworth.Endpoint,
  secret_key_base: "Ws2IPhTcqX0egcnAkq8hFLR2nNHgZV+LT0Iw8Px0bgtwTL2h6K3+5h+aRjCAb2Zo"

# Configure your database
config :honeyworth, Honeyworth.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "honeyworth_prod",
  pool_size: 20
