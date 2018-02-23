defmodule BookmarkApi.Router do
  use BookmarkApi.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BookmarkApi, as: :api do
    pipe_through :api

    scope "/v1", Api.V1, as: :v1 do
      resources "/users", UserController, only: [:index, :create] do
        resources "/bookmarks", BookmarkController, only: [:index, :create, :delete]
      end
    end
  end
end
