defmodule StoryTime.BookController do
  use StoryTime.Web, :controller

  def index(conn, _params) do
    books = Repo.all(StoryTime.Book)
    render conn, "index.html", books: books
  end
end
