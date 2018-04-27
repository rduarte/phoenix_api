defmodule Openfriday.Api.Estado do
  use Ecto.Schema
  import Ecto.Changeset

  schema "estados" do
    field :nome, :string
    field :uf, :string
    has_many :clientes, Openfriday.Api.Cliente

    timestamps()
  end

  @doc false
  def changeset(estado, attrs) do
    estado
    |> cast(attrs, [:nome, :uf])
    |> validate_required([:nome, :uf])
  end
end
