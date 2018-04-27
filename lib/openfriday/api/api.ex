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
    contas = Repo.all(Conta)
    Repo.preload(contas, [:produtos, :cliente, cliente: :estado])
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

  alias Openfriday.Api.Categoria

  @doc """
  Returns the list of categorias.

  ## Examples

      iex> list_categorias()
      [%Categoria{}, ...]

  """
  def list_categorias do
    categorias = Repo.all(Categoria)
    Repo.preload(categorias, [:produtos, produtos: :categoria])
  end

  @doc """
  Gets a single categoria.

  Raises `Ecto.NoResultsError` if the Categoria does not exist.

  ## Examples

      iex> get_categoria!(123)
      %Categoria{}

      iex> get_categoria!(456)
      ** (Ecto.NoResultsError)

  """
  def get_categoria!(id), do: Repo.get!(Categoria, id)

  @doc """
  Creates a categoria.

  ## Examples

      iex> create_categoria(%{field: value})
      {:ok, %Categoria{}}

      iex> create_categoria(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_categoria(attrs \\ %{}) do
    %Categoria{}
    |> Categoria.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a categoria.

  ## Examples

      iex> update_categoria(categoria, %{field: new_value})
      {:ok, %Categoria{}}

      iex> update_categoria(categoria, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_categoria(%Categoria{} = categoria, attrs) do
    categoria
    |> Categoria.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Categoria.

  ## Examples

      iex> delete_categoria(categoria)
      {:ok, %Categoria{}}

      iex> delete_categoria(categoria)
      {:error, %Ecto.Changeset{}}

  """
  def delete_categoria(%Categoria{} = categoria) do
    Repo.delete(categoria)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking categoria changes.

  ## Examples

      iex> change_categoria(categoria)
      %Ecto.Changeset{source: %Categoria{}}

  """
  def change_categoria(%Categoria{} = categoria) do
    Categoria.changeset(categoria, %{})
  end

  alias Openfriday.Api.Produto

  @doc """
  Returns the list of produtos.

  ## Examples

      iex> list_produtos()
      [%Produto{}, ...]

  """
  def list_produtos do
    Repo.all(Produto)
  end

  @doc """
  Gets a single produto.

  Raises `Ecto.NoResultsError` if the Produto does not exist.

  ## Examples

      iex> get_produto!(123)
      %Produto{}

      iex> get_produto!(456)
      ** (Ecto.NoResultsError)

  """
  def get_produto!(id), do: Repo.get!(Produto, id)

  @doc """
  Creates a produto.

  ## Examples

      iex> create_produto(%{field: value})
      {:ok, %Produto{}}

      iex> create_produto(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_produto(attrs \\ %{}) do
    %Produto{}
    |> Produto.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a produto.

  ## Examples

      iex> update_produto(produto, %{field: new_value})
      {:ok, %Produto{}}

      iex> update_produto(produto, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_produto(%Produto{} = produto, attrs) do
    produto
    |> Produto.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Produto.

  ## Examples

      iex> delete_produto(produto)
      {:ok, %Produto{}}

      iex> delete_produto(produto)
      {:error, %Ecto.Changeset{}}

  """
  def delete_produto(%Produto{} = produto) do
    Repo.delete(produto)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking produto changes.

  ## Examples

      iex> change_produto(produto)
      %Ecto.Changeset{source: %Produto{}}

  """
  def change_produto(%Produto{} = produto) do
    Produto.changeset(produto, %{})
  end

  alias Openfriday.Api.Cliente

  @doc """
  Returns the list of clientes.

  ## Examples

      iex> list_clientes()
      [%Cliente{}, ...]

  """
  def list_clientes do
    clientes = Repo.all(Cliente)
    Repo.preload(clientes, :estado)
  end

  @doc """
  Gets a single cliente.

  Raises `Ecto.NoResultsError` if the Cliente does not exist.

  ## Examples

      iex> get_cliente!(123)
      %Cliente{}

      iex> get_cliente!(456)
      ** (Ecto.NoResultsError)

  """
  def get_cliente!(id), do: Repo.get!(Cliente, id)

  @doc """
  Creates a cliente.

  ## Examples

      iex> create_cliente(%{field: value})
      {:ok, %Cliente{}}

      iex> create_cliente(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_cliente(attrs \\ %{}) do
    %Cliente{}
    |> Cliente.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a cliente.

  ## Examples

      iex> update_cliente(cliente, %{field: new_value})
      {:ok, %Cliente{}}

      iex> update_cliente(cliente, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_cliente(%Cliente{} = cliente, attrs) do
    cliente
    |> Cliente.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Cliente.

  ## Examples

      iex> delete_cliente(cliente)
      {:ok, %Cliente{}}

      iex> delete_cliente(cliente)
      {:error, %Ecto.Changeset{}}

  """
  def delete_cliente(%Cliente{} = cliente) do
    Repo.delete(cliente)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking cliente changes.

  ## Examples

      iex> change_cliente(cliente)
      %Ecto.Changeset{source: %Cliente{}}

  """
  def change_cliente(%Cliente{} = cliente) do
    Cliente.changeset(cliente, %{})
  end

  alias Openfriday.Api.Estado

  @doc """
  Returns the list of estados.

  ## Examples

      iex> list_estados()
      [%Estado{}, ...]

  """
  def list_estados do
    Repo.all(Estado)
  end

  @doc """
  Gets a single estado.

  Raises `Ecto.NoResultsError` if the Estado does not exist.

  ## Examples

      iex> get_estado!(123)
      %Estado{}

      iex> get_estado!(456)
      ** (Ecto.NoResultsError)

  """
  def get_estado!(id), do: Repo.get!(Estado, id)

  @doc """
  Creates a estado.

  ## Examples

      iex> create_estado(%{field: value})
      {:ok, %Estado{}}

      iex> create_estado(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_estado(attrs \\ %{}) do
    %Estado{}
    |> Estado.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a estado.

  ## Examples

      iex> update_estado(estado, %{field: new_value})
      {:ok, %Estado{}}

      iex> update_estado(estado, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_estado(%Estado{} = estado, attrs) do
    estado
    |> Estado.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Estado.

  ## Examples

      iex> delete_estado(estado)
      {:ok, %Estado{}}

      iex> delete_estado(estado)
      {:error, %Ecto.Changeset{}}

  """
  def delete_estado(%Estado{} = estado) do
    Repo.delete(estado)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking estado changes.

  ## Examples

      iex> change_estado(estado)
      %Ecto.Changeset{source: %Estado{}}

  """
  def change_estado(%Estado{} = estado) do
    Estado.changeset(estado, %{})
  end
end
