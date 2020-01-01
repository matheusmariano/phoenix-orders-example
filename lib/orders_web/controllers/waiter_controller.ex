defmodule OrdersWeb.WaiterController do
  use OrdersWeb, :controller

  alias Orders.Accounts
  alias Orders.Accounts.Waiter

  action_fallback OrdersWeb.FallbackController

  def index(conn, _params) do
    waiters = Accounts.list_waiters()
    render(conn, "index.json", waiters: waiters)
  end

  def create(conn, %{"waiter" => waiter_params}) do
    with {:ok, %Waiter{} = waiter} <- Accounts.create_waiter(waiter_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.waiter_path(conn, :show, waiter))
      |> render("show.json", waiter: waiter)
    end
  end

  def show(conn, %{"id" => id}) do
    waiter = Accounts.get_waiter!(id)
    render(conn, "show.json", waiter: waiter)
  end

  def update(conn, %{"id" => id, "waiter" => waiter_params}) do
    waiter = Accounts.get_waiter!(id)

    with {:ok, %Waiter{} = waiter} <- Accounts.update_waiter(waiter, waiter_params) do
      render(conn, "show.json", waiter: waiter)
    end
  end

  def delete(conn, %{"id" => id}) do
    waiter = Accounts.get_waiter!(id)

    with {:ok, %Waiter{}} <- Accounts.delete_waiter(waiter) do
      send_resp(conn, :no_content, "")
    end
  end
end
