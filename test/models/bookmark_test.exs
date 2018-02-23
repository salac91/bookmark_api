defmodule BookmarkApi.BookmarkTest do
  use BookmarkApi.ModelCase

  alias BookmarkApi.Bookmark

  @valid_attrs %{description: "some description", url: "some url"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Bookmark.changeset(%Bookmark{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Bookmark.changeset(%Bookmark{}, @invalid_attrs)
    refute changeset.valid?
  end
end
