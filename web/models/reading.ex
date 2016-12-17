defmodule StoryTime.Reading do
  use StoryTime.Web, :model

  schema "readings" do
    belongs_to :user, StoryTime.User
    belongs_to :book, StoryTime.Book

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [])
    |> validate_required([])
  end
end
