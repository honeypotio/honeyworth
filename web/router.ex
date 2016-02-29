defmodule Honeyworth.Router do
  use Honeyworth.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug PlugUtm
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Honeyworth do
    pipe_through :browser

    get "/", ProspectController, :new
    post "/", ProspectController, :create
  end

  scope "/pages", Honeyworth do
    pipe_through :browser

    get "/legal_notice", PageController, :legal_notice
  end
end
