defmodule Recompile.Content.Page do
  @enforce_keys [:title, :body]
  defstruct [:title, :body]

  def build(_filename, attrs, body) do
    struct!(
      __MODULE__,
      [body: body] ++ Map.to_list(attrs)
    )
  end
end
