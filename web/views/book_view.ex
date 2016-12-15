defmodule StoryTime.BookView do
  use StoryTime.Web, :view
  alias StoryTime.Book

  def book_name(%Book{title: title}) do
    title
  end

  def book_mainchar(%Book{mainChar: mainChar}) do
    mainChar
  end

  def book_titlechar(%Book{titleChar: titleChar}) do
    titleChar
  end
end
