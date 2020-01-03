defmodule Orders.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Orders.Repo

  alias Orders.Accounts.Waiter

  @doc """
  Returns the list of waiters.

  ## Examples

      iex> list_waiters()
      [%Waiter{}, ...]

  """
  def list_waiters do
    Repo.all(Waiter)
  end

  @doc """
  Gets a single waiter.

  Raises `Ecto.NoResultsError` if the Waiter does not exist.

  ## Examples

      iex> get_waiter!(123)
      %Waiter{}

      iex> get_waiter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_waiter!(id), do: Repo.get!(Waiter, id)

  @doc """
  Creates a waiter.

  ## Examples

      iex> create_waiter(%{field: value})
      {:ok, %Waiter{}}

      iex> create_waiter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_waiter(attrs \\ %{}) do
    %Waiter{}
    |> Waiter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a waiter.

  ## Examples

      iex> update_waiter(waiter, %{field: new_value})
      {:ok, %Waiter{}}

      iex> update_waiter(waiter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_waiter(%Waiter{} = waiter, attrs) do
    waiter
    |> Waiter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Waiter.

  ## Examples

      iex> delete_waiter(waiter)
      {:ok, %Waiter{}}

      iex> delete_waiter(waiter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_waiter(%Waiter{} = waiter) do
    Repo.delete(waiter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking waiter changes.

  ## Examples

      iex> change_waiter(waiter)
      %Ecto.Changeset{source: %Waiter{}}

  """
  def change_waiter(%Waiter{} = waiter) do
    Waiter.changeset(waiter, %{})
  end

  alias Orders.Accounts.Customer

  @doc """
  Returns the list of customers.

  ## Examples

      iex> list_customers()
      [%Customer{}, ...]

  """
  def list_customers do
    Repo.all(Customer)
  end

  @doc """
  Gets a single customer.

  Raises `Ecto.NoResultsError` if the Customer does not exist.

  ## Examples

      iex> get_customer!(123)
      %Customer{}

      iex> get_customer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_customer!(id), do: Repo.get!(Customer, id)

  @doc """
  Creates a customer.

  ## Examples

      iex> create_customer(%{field: value})
      {:ok, %Customer{}}

      iex> create_customer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_customer(attrs \\ %{}) do
    %Customer{}
    |> Customer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a customer.

  ## Examples

      iex> update_customer(customer, %{field: new_value})
      {:ok, %Customer{}}

      iex> update_customer(customer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_customer(%Customer{} = customer, attrs) do
    customer
    |> Customer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Customer.

  ## Examples

      iex> delete_customer(customer)
      {:ok, %Customer{}}

      iex> delete_customer(customer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_customer(%Customer{} = customer) do
    Repo.delete(customer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking customer changes.

  ## Examples

      iex> change_customer(customer)
      %Ecto.Changeset{source: %Customer{}}

  """
  def change_customer(%Customer{} = customer) do
    Customer.changeset(customer, %{})
  end
end
