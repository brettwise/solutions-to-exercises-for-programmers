defmodule AllTogether.Router do
  use AllTogether.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AllTogether do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/calc-tip", CalcTipController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", AllTogether do
  #   pipe_through :api
  # end
end