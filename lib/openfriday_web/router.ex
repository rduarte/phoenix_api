defmodule OpenfridayWeb.Router do
  use OpenfridayWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    #plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", OpenfridayWeb do
    pipe_through :api
    resources "/contas", ContaController, except: [:new, :edit]

  end
end
