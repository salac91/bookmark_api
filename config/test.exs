use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :bookmark_api, BookmarkApi.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :bookmark_api, BookmarkApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "ubuntu",
  password: "password",
  database: "bookmark_api_test",
  hostname: "localhost",
  port: "5432",
  pool: Ecto.Adapters.SQL.Sandbox
