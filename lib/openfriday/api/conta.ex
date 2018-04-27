defmodule Openfriday.Api.Conta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contas" do
    field :numero, :string
    many_to_many :produtos, Openfriday.Api.Produto, join_through: "contas_produtos"
    belongs_to :cliente, Openfriday.Api.Cliente

    timestamps()
  end

  @doc false
  def changeset(conta, attrs) do
    conta
    |> cast(attrs, [:numero, :cliente_id])
    |> validate_required([:numero, :cliente_id])
    |> unique_constraint(:numero)
  end
end
