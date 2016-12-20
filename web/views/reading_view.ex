defmodule StoryTime.ReadingView do
  use StoryTime.Web, :view
  import StoryTime.BookView, only:
    [book_name: 1, book_mainchar: 1, book_titlechar: 1]
end
