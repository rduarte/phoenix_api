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
end
