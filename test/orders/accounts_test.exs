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
end
