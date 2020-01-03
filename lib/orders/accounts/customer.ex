defmodule Orders.Accounts.Customer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "customers" do
    field :closed_at, :utc_datetime
    field :name, :string
    field :table, :integer

    timestamps()
  end

  @doc false
  def changeset(customer, attrs) do
    customer
    |> cast(attrs, [:name, :table, :closed_at])
    |> validate_required([:name, :table])
  end
end
