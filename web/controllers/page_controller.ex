defmodule StoryTime.PageController do
  use StoryTime.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
