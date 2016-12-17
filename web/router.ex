defmodule StoryTime.Router do
  use StoryTime.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug StoryTime.Auth, repo: StoryTime.Repo
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", StoryTime do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    resources "/users", UserController, only: [:index, :show, :new, :create]
    resources "/sessions", SessionController, only: [:new, :create, :delete]
    resources "/books", BookController, only: [:index, :new, :show, :create]
    resources "/readings", ReadingController, only: [:index, :show, :new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", StoryTime do
  #   pipe_through :api
  # end
end
