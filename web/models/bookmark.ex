defmodule BookmarkApi.Bookmark do
  use BookmarkApi.Web, :model
  import Ecto.Query

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

  # def filter_by_search(term)
  #   query = from b in BookmarkApi.Bookmark, where: b.description like term or b.url like term
  #   BookmarkApi.Repo.all(query)
  # end
end
