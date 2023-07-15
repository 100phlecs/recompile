defmodule Recompile.Content do
  #
  # Pages
  #
  defmodule Pages do
    use NimblePublisher,
      build: Recompile.Content.Page,
      from: "content/pages/*.md",
      as: :pages

    def all(), do: @pages
  end

  def list_pages() do
    Pages.all()
  end
end
