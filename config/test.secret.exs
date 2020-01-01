use Mix.Config

config :orders, Orders.Repo,
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DB_TEST"),
  hostname: System.get_env("POSTGRES_HOST")
