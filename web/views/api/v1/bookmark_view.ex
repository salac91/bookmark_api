defmodule BookmarkApi.Api.V1.BookmarkView do
  use BookmarkApi.Web, :view

  def render("index.json", %{bookmarks: bookmarks}) do
    %{data: render_many(bookmarks, BookmarkApi.Api.V1.BookmarkView, "bookmark.json")}
  end

  def render("show.json", %{bookmark: bookmark}) do
    %{data: render_one(bookmark, BookmarkApi.Api.V1.BookmarkView, "bookmark.json")}
  end

  def render("bookmark.json", %{bookmark: bookmark}) do
    %{url: bookmark.url,
      description: bookmark.description}
  end
end
