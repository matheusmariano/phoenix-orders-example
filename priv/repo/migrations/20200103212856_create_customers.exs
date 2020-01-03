defmodule Orders.Repo.Migrations.CreateCustomers do
  use Ecto.Migration

  def change do
    create table(:customers) do
      add :name, :string
      add :table, :integer
      add :closed_at, :utc_datetime, default: nil

      timestamps()
    end

  end
end
