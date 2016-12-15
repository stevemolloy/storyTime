defmodule StoryTime.BookController do
  use StoryTime.Web, :controller

  def index(conn, _params) do
    books = Repo.all(StoryTime.Book)
    render conn, "index.html", books: books
  end

  def show(conn, %{"id" => id}) do
    book = Repo.get(StoryTime.Book, id)
    render conn, "show.html", book: book
  end
end
