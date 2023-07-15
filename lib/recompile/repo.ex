defmodule Recompile.Repo do
  use Ecto.Repo,
    otp_app: :recompile,
    adapter: Ecto.Adapters.Postgres
end
