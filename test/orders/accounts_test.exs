defmodule Orders.AccountsTest do
  use Orders.DataCase

  alias Orders.Accounts

  describe "waiters" do
    alias Orders.Accounts.Waiter

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def waiter_fixture(attrs \\ %{}) do
      {:ok, waiter} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_waiter()

      waiter
    end

    test "list_waiters/0 returns all waiters" do
      waiter = waiter_fixture()
      assert Accounts.list_waiters() == [waiter]
    end

    test "get_waiter!/1 returns the waiter with given id" do
      waiter = waiter_fixture()
      assert Accounts.get_waiter!(waiter.id) == waiter
    end

    test "create_waiter/1 with valid data creates a waiter" do
      assert {:ok, %Waiter{} = waiter} = Accounts.create_waiter(@valid_attrs)
      assert waiter.name == "some name"
    end

    test "create_waiter/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_waiter(@invalid_attrs)
    end

    test "update_waiter/2 with valid data updates the waiter" do
      waiter = waiter_fixture()
      assert {:ok, %Waiter{} = waiter} = Accounts.update_waiter(waiter, @update_attrs)
      assert waiter.name == "some updated name"
    end

    test "update_waiter/2 with invalid data returns error changeset" do
      waiter = waiter_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_waiter(waiter, @invalid_attrs)
      assert waiter == Accounts.get_waiter!(waiter.id)
    end

    test "delete_waiter/1 deletes the waiter" do
      waiter = waiter_fixture()
      assert {:ok, %Waiter{}} = Accounts.delete_waiter(waiter)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_waiter!(waiter.id) end
    end

    test "change_waiter/1 returns a waiter changeset" do
      waiter = waiter_fixture()
      assert %Ecto.Changeset{} = Accounts.change_waiter(waiter)
    end
  end

  describe "customers" do
    alias Orders.Accounts.Customer

    @valid_attrs %{closed_at: "2010-04-17T14:00:00Z", name: "some name", table: 42}
    @update_attrs %{closed_at: "2011-05-18T15:01:01Z", name: "some updated name", table: 43}
    @invalid_attrs %{closed_at: nil, name: nil, table: nil}

    def customer_fixture(attrs \\ %{}) do
      {:ok, customer} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_customer()

      customer
    end

    test "list_customers/0 returns all customers" do
      customer = customer_fixture()
      assert Accounts.list_customers() == [customer]
    end

    test "get_customer!/1 returns the customer with given id" do
      customer = customer_fixture()
      assert Accounts.get_customer!(customer.id) == customer
    end

    test "create_customer/1 with valid data creates a customer" do
      assert {:ok, %Customer{} = customer} = Accounts.create_customer(@valid_attrs)
      assert customer.closed_at == DateTime.from_naive!(~N[2010-04-17T14:00:00Z], "Etc/UTC")
      assert customer.name == "some name"
      assert customer.table == 42
    end

    test "create_customer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_customer(@invalid_attrs)
    end

    test "update_customer/2 with valid data updates the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{} = customer} = Accounts.update_customer(customer, @update_attrs)
      assert customer.closed_at == DateTime.from_naive!(~N[2011-05-18T15:01:01Z], "Etc/UTC")
      assert customer.name == "some updated name"
      assert customer.table == 43
    end

    test "update_customer/2 with invalid data returns error changeset" do
      customer = customer_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_customer(customer, @invalid_attrs)
      assert customer == Accounts.get_customer!(customer.id)
    end

    test "delete_customer/1 deletes the customer" do
      customer = customer_fixture()
      assert {:ok, %Customer{}} = Accounts.delete_customer(customer)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_customer!(customer.id) end
    end

    test "change_customer/1 returns a customer changeset" do
      customer = customer_fixture()
      assert %Ecto.Changeset{} = Accounts.change_customer(customer)
    end
  end
end
