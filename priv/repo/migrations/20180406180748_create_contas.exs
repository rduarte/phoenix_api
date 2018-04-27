defmodule Openfriday.Repo.Migrations.CreateContas do
  use Ecto.Migration

  def change do
    create table(:contas) do
      add :cliente_id, :integer
      add :numero, :string

      timestamps()
    end
  end
end
