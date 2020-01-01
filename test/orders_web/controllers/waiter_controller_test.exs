defmodule OrdersWeb.WaiterControllerTest do
  use OrdersWeb.ConnCase

  alias Orders.Accounts
  alias Orders.Accounts.Waiter

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  def fixture(:waiter) do
    {:ok, waiter} = Accounts.create_waiter(@create_attrs)
    waiter
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all waiters", %{conn: conn} do
      conn = get(conn, Routes.waiter_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create waiter" do
    test "renders waiter when data is valid", %{conn: conn} do
      conn = post(conn, Routes.waiter_path(conn, :create), waiter: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.waiter_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.waiter_path(conn, :create), waiter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update waiter" do
    setup [:create_waiter]

    test "renders waiter when data is valid", %{conn: conn, waiter: %Waiter{id: id} = waiter} do
      conn = put(conn, Routes.waiter_path(conn, :update, waiter), waiter: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.waiter_path(conn, :show, id))

      assert %{
               "id" => id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, waiter: waiter} do
      conn = put(conn, Routes.waiter_path(conn, :update, waiter), waiter: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete waiter" do
    setup [:create_waiter]

    test "deletes chosen waiter", %{conn: conn, waiter: waiter} do
      conn = delete(conn, Routes.waiter_path(conn, :delete, waiter))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.waiter_path(conn, :show, waiter))
      end
    end
  end

  defp create_waiter(_) do
    waiter = fixture(:waiter)
    {:ok, waiter: waiter}
  end
end
