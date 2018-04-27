defmodule Openfriday.Repo.Migrations.CreateCategorias do
  use Ecto.Migration

  def change do
    create table(:categorias) do
      add :nome, :string

      timestamps()
    end

  end
end
