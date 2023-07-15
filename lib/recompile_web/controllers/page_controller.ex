defmodule RecompileWeb.PageController do
  use RecompileWeb, :controller

  alias Recompile.Content

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def list(conn, _params) do
    pages = Content.list_pages()

    render(conn, :list, pages: pages)
  end
end
