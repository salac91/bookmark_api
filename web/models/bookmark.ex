defmodule BookmarkApi.Bookmark do
  use BookmarkApi.Web, :model

  schema "bookmars" do
    field :url, :string
    field :description, :string
    belongs_to :user, BookmarkApi.User

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url, :description])
    |> validate_required([:url, :description])
  end
end
