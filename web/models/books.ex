defmodule StoryTime.Book do
  use StoryTime.Web, :model

  schema "books" do
    field :title, :string
    field :mainChar, :string
    field :titleChar, :string

    timestamps
  end
end
