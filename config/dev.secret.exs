use Mix.Config

config :orders, Orders.Repo,
  username: System.get_env("POSTGRES_USER"),
  password: System.get_env("POSTGRES_PASSWORD"),
  database: System.get_env("POSTGRES_DB"),
  hostname: System.get_env("POSTGRES_HOST")

config :orders, OrdersWeb.Endpoint,
  http: [
    port: String.to_integer(System.get_env("PORT") || "4000")
  ]
