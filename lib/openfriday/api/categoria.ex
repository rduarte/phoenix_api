defmodule Openfriday.Api.Categoria do
  use Ecto.Schema
  import Ecto.Changeset


  schema "categorias" do
    field :nome, :string
    has_many :produtos, Openfriday.Api.Produto
    timestamps()
  end

  @doc false
  def changeset(categoria, attrs) do
    categoria
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
