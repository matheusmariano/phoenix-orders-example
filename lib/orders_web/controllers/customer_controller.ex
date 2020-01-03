defmodule OrdersWeb.CustomerController do
  use OrdersWeb, :controller

  alias Orders.Accounts
  alias Orders.Accounts.Customer

  action_fallback OrdersWeb.FallbackController

  def index(conn, _params) do
    customers = Accounts.list_customers()
    render(conn, "index.json", customers: customers)
  end

  def create(conn, %{"customer" => customer_params}) do
    with {:ok, %Customer{} = customer} <- Accounts.create_customer(customer_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.customer_path(conn, :show, customer))
      |> render("show.json", customer: customer)
    end
  end

  def show(conn, %{"id" => id}) do
    customer = Accounts.get_customer!(id)
    render(conn, "show.json", customer: customer)
  end

  def update(conn, %{"id" => id, "customer" => customer_params}) do
    customer = Accounts.get_customer!(id)

    with {:ok, %Customer{} = customer} <- Accounts.update_customer(customer, customer_params) do
      render(conn, "show.json", customer: customer)
    end
  end

  def delete(conn, %{"id" => id}) do
    customer = Accounts.get_customer!(id)

    with {:ok, %Customer{}} <- Accounts.delete_customer(customer) do
      send_resp(conn, :no_content, "")
    end
  end
end
