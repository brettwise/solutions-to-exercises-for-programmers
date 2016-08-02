defmodule TipCalc.Router do
  use TipCalc.Web, :router

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

  scope "/", TipCalc do
    pipe_through :browser # Use the default browser stack

    get "/tip-calc/:tip_percentage/:bill_amount", PageController, :calc_tip
    get "/tip-calc/:tip_percentage", PageController, :calc_tip
    get "/tip-calc", PageController, :calc_tip
    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", TipCalc do
  #   pipe_through :api
  # end
end
