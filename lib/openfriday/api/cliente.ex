defmodule Openfriday.Api.Cliente do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clientes" do
    field :nome, :string
    field :endereco, :string
    field :cidade, :string
    
    has_many :contas, Openfriday.Api.Conta
    belongs_to :estado, Openfriday.Api.Estado

    timestamps()
  end

  @doc false
  def changeset(cliente, attrs) do
    cliente
    |> cast(attrs, [:nome, :endereco, :cidade])
    |> validate_required([:nome, :endereco, :cidade])
  end
end
