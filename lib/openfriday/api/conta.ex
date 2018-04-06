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
    |> validate_number(:cliente_id, greater_than_or_equal_to: 1, less_than_or_equal_to: 999999)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:dominio)
    |> unique_constraint(:cliente_id)
    |> unique_constraint(:email)
  end
end
