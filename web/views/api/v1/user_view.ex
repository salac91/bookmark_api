defmodule BookmarkApi.Api.V1.UserView do
  use BookmarkApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, BookmarkApi.Api.V1.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, BookmarkApi.Api.V1.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{name: user.name,
      email: user.email,
      password: user.password,
    }
  end
end
