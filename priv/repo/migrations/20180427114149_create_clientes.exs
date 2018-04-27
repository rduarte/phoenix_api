defmodule Openfriday.Repo.Migrations.CreateClientes do
  use Ecto.Migration

  def change do
    create table(:clientes) do
      add :nome, :string
      add :endereco, :string
      add :cidade, :string
      add :estado_id, references(:estados, on_delete: :nothing)

      timestamps()
    end

    create index(:clientes, [:estado_id])

  end
end
