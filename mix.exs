defmodule Honeyworth.Mixfile do
  use Mix.Project

  def project do
    [app: :honeyworth,
     version: "0.0.1",
     elixir: "~> 1.2",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     test_coverage: [tool: ExCoveralls],
     preferred_cli_env: ["coveralls": :test, "coveralls.detail": :test, "coveralls.post": :test],
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Honeyworth, []},
     applications: [:phoenix, :phoenix_html, :cowboy, :logger,
                    :phoenix_ecto, :postgrex, :rollbax]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.0"},
     {:phoenix_ecto, "~> 2.0"},
     {:postgrex, "~> 0.11.0"},
     {:phoenix_html, "~> 2.1"},
     {:phoenix_haml, github: "chrismccord/phoenix_haml"},
     {:plug_utm, "~> 0.0.2"},
     {:rollbax, "~> 0.5"},
     {:excoveralls, "~> 0.4", only: :test},
     {:phoenix_live_reload, "~> 1.0.3", only: :dev},
     {:cowboy, "~> 1.0"},
     {:mailgun, "~> 0.1.1"}]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
