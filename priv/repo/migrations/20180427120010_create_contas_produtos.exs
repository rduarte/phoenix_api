defmodule Openfriday.Repo.Migrations.CreateContasProdutos do
  use Ecto.Migration

  def change do
    create table(:contas_produtos, primary_key: false) do
      add :conta_id, references(:contas), primary_key: true
      add :produto_id, references(:produtos), primary_key: true
    end
  end
end
