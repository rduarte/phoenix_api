defmodule Openfriday.Repo.Migrations.CreateContas do
  use Ecto.Migration

  def change do
    create table(:contas) do
      add :dominio, :string
      add :cliente_id, :integer
      add :email, :string

      timestamps()
    end

    create unique_index(:contas, [:dominio])
    create unique_index(:contas, [:cliente_id])
    create unique_index(:contas, [:email])

  end
end
