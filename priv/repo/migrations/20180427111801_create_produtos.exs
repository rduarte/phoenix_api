defmodule Openfriday.Repo.Migrations.CreateProdutos do
  use Ecto.Migration

  def change do
    create table(:produtos) do
      add :nome, :string
      add :categoria_id, references(:categorias, on_delete: :nothing)

      timestamps()
    end

    create index(:produtos, [:categoria_id])
  end
end
