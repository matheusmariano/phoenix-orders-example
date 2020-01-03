defmodule OrdersWeb.Router do
  use OrdersWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", OrdersWeb do
    pipe_through :api

    api_actions = [:index, :show, :create, :update, :delete]

    resources "/waiters", WaiterController, only: api_actions
    resources "/customers", CustomerController, only: api_actions
  end
end
