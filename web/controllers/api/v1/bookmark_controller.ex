defmodule BookmarkApi.Api.V1.BookmarkController do
  use BookmarkApi.Web, :controller

  alias BookmarkApi.Bookmark
  alias BookmarkApi.User

  def index(conn, %{"user_id" => user_id, "search_term" => search_term}) do
    user = Repo.get!(User, user_id) |> Repo.preload([:bookmarks])
    render(conn, "index.json", bookmarks: user.bookmarks)
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

  def delete(conn, %{"id" => id}) do
    bookmark = Repo.get!(Bookmark, id)

    Repo.delete!(bookmark)

    send_resp(conn, :no_content, "")
  end
end
