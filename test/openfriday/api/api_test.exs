defmodule Openfriday.ApiTest do
  use Openfriday.DataCase

  alias Openfriday.Api

  describe "contas" do
    alias Openfriday.Api.Conta

    @valid_attrs %{cliente_id: 42, dominio: "some dominio", email: "some email"}
    @update_attrs %{cliente_id: 43, dominio: "some updated dominio", email: "some updated email"}
    @invalid_attrs %{cliente_id: nil, dominio: nil, email: nil}

    def conta_fixture(attrs \\ %{}) do
      {:ok, conta} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_conta()

      conta
    end

    test "list_contas/0 returns all contas" do
      conta = conta_fixture()
      assert Api.list_contas() == [conta]
    end

    test "get_conta!/1 returns the conta with given id" do
      conta = conta_fixture()
      assert Api.get_conta!(conta.id) == conta
    end

    test "create_conta/1 with valid data creates a conta" do
      assert {:ok, %Conta{} = conta} = Api.create_conta(@valid_attrs)
      assert conta.cliente_id == 42
      assert conta.dominio == "some dominio"
      assert conta.email == "some email"
    end

    test "create_conta/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_conta(@invalid_attrs)
    end

    test "update_conta/2 with valid data updates the conta" do
      conta = conta_fixture()
      assert {:ok, conta} = Api.update_conta(conta, @update_attrs)
      assert %Conta{} = conta
      assert conta.cliente_id == 43
      assert conta.dominio == "some updated dominio"
      assert conta.email == "some updated email"
    end

    test "update_conta/2 with invalid data returns error changeset" do
      conta = conta_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_conta(conta, @invalid_attrs)
      assert conta == Api.get_conta!(conta.id)
    end

    test "delete_conta/1 deletes the conta" do
      conta = conta_fixture()
      assert {:ok, %Conta{}} = Api.delete_conta(conta)
      assert_raise Ecto.NoResultsError, fn -> Api.get_conta!(conta.id) end
    end

    test "change_conta/1 returns a conta changeset" do
      conta = conta_fixture()
      assert %Ecto.Changeset{} = Api.change_conta(conta)
    end
  end

  describe "categorias" do
    alias Openfriday.Api.Categoria

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def categoria_fixture(attrs \\ %{}) do
      {:ok, categoria} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_categoria()

      categoria
    end

    test "list_categorias/0 returns all categorias" do
      categoria = categoria_fixture()
      assert Api.list_categorias() == [categoria]
    end

    test "get_categoria!/1 returns the categoria with given id" do
      categoria = categoria_fixture()
      assert Api.get_categoria!(categoria.id) == categoria
    end

    test "create_categoria/1 with valid data creates a categoria" do
      assert {:ok, %Categoria{} = categoria} = Api.create_categoria(@valid_attrs)
      assert categoria.nome == "some nome"
    end

    test "create_categoria/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_categoria(@invalid_attrs)
    end

    test "update_categoria/2 with valid data updates the categoria" do
      categoria = categoria_fixture()
      assert {:ok, categoria} = Api.update_categoria(categoria, @update_attrs)
      assert %Categoria{} = categoria
      assert categoria.nome == "some updated nome"
    end

    test "update_categoria/2 with invalid data returns error changeset" do
      categoria = categoria_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_categoria(categoria, @invalid_attrs)
      assert categoria == Api.get_categoria!(categoria.id)
    end

    test "delete_categoria/1 deletes the categoria" do
      categoria = categoria_fixture()
      assert {:ok, %Categoria{}} = Api.delete_categoria(categoria)
      assert_raise Ecto.NoResultsError, fn -> Api.get_categoria!(categoria.id) end
    end

    test "change_categoria/1 returns a categoria changeset" do
      categoria = categoria_fixture()
      assert %Ecto.Changeset{} = Api.change_categoria(categoria)
    end
  end

  describe "produtos" do
    alias Openfriday.Api.Produto

    @valid_attrs %{nome: "some nome"}
    @update_attrs %{nome: "some updated nome"}
    @invalid_attrs %{nome: nil}

    def produto_fixture(attrs \\ %{}) do
      {:ok, produto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_produto()

      produto
    end

    test "list_produtos/0 returns all produtos" do
      produto = produto_fixture()
      assert Api.list_produtos() == [produto]
    end

    test "get_produto!/1 returns the produto with given id" do
      produto = produto_fixture()
      assert Api.get_produto!(produto.id) == produto
    end

    test "create_produto/1 with valid data creates a produto" do
      assert {:ok, %Produto{} = produto} = Api.create_produto(@valid_attrs)
      assert produto.nome == "some nome"
    end

    test "create_produto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_produto(@invalid_attrs)
    end

    test "update_produto/2 with valid data updates the produto" do
      produto = produto_fixture()
      assert {:ok, produto} = Api.update_produto(produto, @update_attrs)
      assert %Produto{} = produto
      assert produto.nome == "some updated nome"
    end

    test "update_produto/2 with invalid data returns error changeset" do
      produto = produto_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_produto(produto, @invalid_attrs)
      assert produto == Api.get_produto!(produto.id)
    end

    test "delete_produto/1 deletes the produto" do
      produto = produto_fixture()
      assert {:ok, %Produto{}} = Api.delete_produto(produto)
      assert_raise Ecto.NoResultsError, fn -> Api.get_produto!(produto.id) end
    end

    test "change_produto/1 returns a produto changeset" do
      produto = produto_fixture()
      assert %Ecto.Changeset{} = Api.change_produto(produto)
    end
  end

  describe "clientes" do
    alias Openfriday.Api.Cliente

    @valid_attrs %{cidade: "some cidade", endereco: "some endereco", nome: "some nome", uf: "some uf"}
    @update_attrs %{cidade: "some updated cidade", endereco: "some updated endereco", nome: "some updated nome", uf: "some updated uf"}
    @invalid_attrs %{cidade: nil, endereco: nil, nome: nil, uf: nil}

    def cliente_fixture(attrs \\ %{}) do
      {:ok, cliente} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_cliente()

      cliente
    end

    test "list_clientes/0 returns all clientes" do
      cliente = cliente_fixture()
      assert Api.list_clientes() == [cliente]
    end

    test "get_cliente!/1 returns the cliente with given id" do
      cliente = cliente_fixture()
      assert Api.get_cliente!(cliente.id) == cliente
    end

    test "create_cliente/1 with valid data creates a cliente" do
      assert {:ok, %Cliente{} = cliente} = Api.create_cliente(@valid_attrs)
      assert cliente.cidade == "some cidade"
      assert cliente.endereco == "some endereco"
      assert cliente.nome == "some nome"
      assert cliente.uf == "some uf"
    end

    test "create_cliente/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_cliente(@invalid_attrs)
    end

    test "update_cliente/2 with valid data updates the cliente" do
      cliente = cliente_fixture()
      assert {:ok, cliente} = Api.update_cliente(cliente, @update_attrs)
      assert %Cliente{} = cliente
      assert cliente.cidade == "some updated cidade"
      assert cliente.endereco == "some updated endereco"
      assert cliente.nome == "some updated nome"
      assert cliente.uf == "some updated uf"
    end

    test "update_cliente/2 with invalid data returns error changeset" do
      cliente = cliente_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_cliente(cliente, @invalid_attrs)
      assert cliente == Api.get_cliente!(cliente.id)
    end

    test "delete_cliente/1 deletes the cliente" do
      cliente = cliente_fixture()
      assert {:ok, %Cliente{}} = Api.delete_cliente(cliente)
      assert_raise Ecto.NoResultsError, fn -> Api.get_cliente!(cliente.id) end
    end

    test "change_cliente/1 returns a cliente changeset" do
      cliente = cliente_fixture()
      assert %Ecto.Changeset{} = Api.change_cliente(cliente)
    end
  end

  describe "estados" do
    alias Openfriday.Api.Estado

    @valid_attrs %{nome: "some nome", uf: "some uf"}
    @update_attrs %{nome: "some updated nome", uf: "some updated uf"}
    @invalid_attrs %{nome: nil, uf: nil}

    def estado_fixture(attrs \\ %{}) do
      {:ok, estado} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Api.create_estado()

      estado
    end

    test "list_estados/0 returns all estados" do
      estado = estado_fixture()
      assert Api.list_estados() == [estado]
    end

    test "get_estado!/1 returns the estado with given id" do
      estado = estado_fixture()
      assert Api.get_estado!(estado.id) == estado
    end

    test "create_estado/1 with valid data creates a estado" do
      assert {:ok, %Estado{} = estado} = Api.create_estado(@valid_attrs)
      assert estado.nome == "some nome"
      assert estado.uf == "some uf"
    end

    test "create_estado/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Api.create_estado(@invalid_attrs)
    end

    test "update_estado/2 with valid data updates the estado" do
      estado = estado_fixture()
      assert {:ok, estado} = Api.update_estado(estado, @update_attrs)
      assert %Estado{} = estado
      assert estado.nome == "some updated nome"
      assert estado.uf == "some updated uf"
    end

    test "update_estado/2 with invalid data returns error changeset" do
      estado = estado_fixture()
      assert {:error, %Ecto.Changeset{}} = Api.update_estado(estado, @invalid_attrs)
      assert estado == Api.get_estado!(estado.id)
    end

    test "delete_estado/1 deletes the estado" do
      estado = estado_fixture()
      assert {:ok, %Estado{}} = Api.delete_estado(estado)
      assert_raise Ecto.NoResultsError, fn -> Api.get_estado!(estado.id) end
    end

    test "change_estado/1 returns a estado changeset" do
      estado = estado_fixture()
      assert %Ecto.Changeset{} = Api.change_estado(estado)
    end
  end
end
