defmodule BookmarkApi.User do
  use BookmarkApi.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :password, :string, default: "password"
    has_many :bookmarks, BookmarkApi.Bookmark

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :email, :password])
    |> validate_required([:name, :email, :password])
  end
end
