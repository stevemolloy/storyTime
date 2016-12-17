defmodule StoryTime.ReadingTest do
  use StoryTime.ModelCase

  alias StoryTime.Reading

  @valid_attrs %{}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reading.changeset(%Reading{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reading.changeset(%Reading{}, @invalid_attrs)
    refute changeset.valid?
  end
end
