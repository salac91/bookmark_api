defmodule BookmarkApi.UserTest do
  use BookmarkApi.ModelCase

  alias BookmarkApi.User

  @valid_attrs %{created_at: ~N[2010-04-17 14:00:00.000000], email: "some email", name: "some name", password: "some password", updated_at: ~N[2010-04-17 14:00:00.000000]}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
