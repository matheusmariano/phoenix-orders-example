defmodule Orders.Accounts.Waiter do
  use Ecto.Schema
  import Ecto.Changeset

  schema "waiters" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(waiter, attrs) do
    waiter
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
