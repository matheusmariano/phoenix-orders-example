defmodule Orders.Repo.Migrations.CreateWaiters do
  use Ecto.Migration

  def change do
    create table(:waiters) do
      add :name, :string

      timestamps()
    end

  end
end
