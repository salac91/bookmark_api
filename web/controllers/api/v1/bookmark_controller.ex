defmodule BookmarkApi.Api.V1.BookmarkController do
  use BookmarkApi.Web, :controller

  alias BookmarkApi.Bookmark
  alias BookmarkApi.User
  alias BookmarkApi.QueryFilter
  alias BookmarkApi.Utils

  def index(conn, params) do
    bookmarks = Bookmark 
                |> QueryFilter.filter(%Bookmark{}, params, [:url, :description, :user_id]) 
                |> Repo.all
    render(conn, "index.json", bookmarks: bookmarks)
  end

  def create(conn, %{"bookmark" => bookmark_params}) do
    changeset = Bookmark.changeset(%Bookmark{}, bookmark_params)

    case Repo.insert(changeset) do
      {:ok, bookmark} ->
        conn
        |> put_status(:created)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(BookmarkApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id, "user_id" => user_id}) do
    bookmark = Bookmark |> Repo.get(id) |> Repo.preload(:user)

    if bookmark.user.id == String.to_integer(user_id) do
      Repo.delete!(bookmark)
      send_resp(conn, :no_content, "Bookmark removed successfully")
    else 
      send_resp(conn, :not_found, "#{bookmark.user.id == user_id}Bookmark with that user_id doesn't exist!")
    end
  end

  def count_a_char_in_url(conn, %{"id" => id}) do
    bookmark = Repo.get!(Bookmark, id)

    text(conn, Utils.count_char_in_string(bookmark.url, "a"))
  end
end
