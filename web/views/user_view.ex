defmodule StoryTime.UserView do
  use StoryTime.Web, :view
  alias StoryTime.User

  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end

end
