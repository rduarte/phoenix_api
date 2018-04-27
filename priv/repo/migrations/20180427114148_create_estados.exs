defmodule Openfriday.Repo.Migrations.CreateEstados do
  use Ecto.Migration

  def change do
    create table(:estados) do
      add :uf, :string
      add :nome, :string

      timestamps()
    end

  end
end
