defmodule Openfriday.Api.Produto do
  use Ecto.Schema
  import Ecto.Changeset

  schema "produtos" do
    field :nome, :string
    many_to_many :contas, Openfriday.Api.Conta, join_through: "contas_produtos"
    belongs_to :categoria, Openfriday.Api.Categoria
    timestamps()
  end

  @doc false
  def changeset(produto, attrs) do
    produto
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
