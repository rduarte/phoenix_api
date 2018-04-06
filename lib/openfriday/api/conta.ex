defmodule Openfriday.Api.Conta do
  use Ecto.Schema
  import Ecto.Changeset

  schema "contas" do
    field :cliente_id, :integer
    field :dominio, :string
    field :email, :string

    timestamps()
  end

  @doc false
  def changeset(conta, attrs) do
    conta
    |> cast(attrs, [:dominio, :cliente_id, :email])
    |> validate_required([:dominio, :cliente_id, :email])
  end
end
