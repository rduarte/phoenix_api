defmodule Openfriday.Api do
  @moduledoc """
  The Api context.
  """

  import Ecto.Query, warn: false
  alias Openfriday.Repo

  alias Openfriday.Api.Conta

  @doc """
  Returns the list of contas.

  ## Examples

      iex> list_contas()
      [%Conta{}, ...]

  """
  def list_contas do
    Repo.all(Conta)
  end

  @doc """
  Gets a single conta.

  Raises `Ecto.NoResultsError` if the Conta does not exist.

  ## Examples

      iex> get_conta!(123)
      %Conta{}

      iex> get_conta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_conta!(id), do: Repo.get!(Conta, id)

  @doc """
  Creates a conta.

  ## Examples

      iex> create_conta(%{field: value})
      {:ok, %Conta{}}

      iex> create_conta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_conta(attrs \\ %{}) do
    %Conta{}
    |> Conta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a conta.

  ## Examples

      iex> update_conta(conta, %{field: new_value})
      {:ok, %Conta{}}

      iex> update_conta(conta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_conta(%Conta{} = conta, attrs) do
    conta
    |> Conta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Conta.

  ## Examples

      iex> delete_conta(conta)
      {:ok, %Conta{}}

      iex> delete_conta(conta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_conta(%Conta{} = conta) do
    Repo.delete(conta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking conta changes.

  ## Examples

      iex> change_conta(conta)
      %Ecto.Changeset{source: %Conta{}}

  """
  def change_conta(%Conta{} = conta) do
    Conta.changeset(conta, %{})
  end
end
