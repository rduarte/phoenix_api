defmodule OpenfridayWeb.ClienteControllerTest do
  use OpenfridayWeb.ConnCase

  alias Openfriday.Api
  alias Openfriday.Api.Cliente

  @create_attrs %{cidade: "some cidade", endereco: "some endereco", nome: "some nome", uf: "some uf"}
  @update_attrs %{cidade: "some updated cidade", endereco: "some updated endereco", nome: "some updated nome", uf: "some updated uf"}
  @invalid_attrs %{cidade: nil, endereco: nil, nome: nil, uf: nil}

  def fixture(:cliente) do
    {:ok, cliente} = Api.create_cliente(@create_attrs)
    cliente
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all clientes", %{conn: conn} do
      conn = get conn, cliente_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create cliente" do
    test "renders cliente when data is valid", %{conn: conn} do
      conn = post conn, cliente_path(conn, :create), cliente: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, cliente_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cidade" => "some cidade",
        "endereco" => "some endereco",
        "nome" => "some nome",
        "uf" => "some uf"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, cliente_path(conn, :create), cliente: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update cliente" do
    setup [:create_cliente]

    test "renders cliente when data is valid", %{conn: conn, cliente: %Cliente{id: id} = cliente} do
      conn = put conn, cliente_path(conn, :update, cliente), cliente: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, cliente_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cidade" => "some updated cidade",
        "endereco" => "some updated endereco",
        "nome" => "some updated nome",
        "uf" => "some updated uf"}
    end

    test "renders errors when data is invalid", %{conn: conn, cliente: cliente} do
      conn = put conn, cliente_path(conn, :update, cliente), cliente: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete cliente" do
    setup [:create_cliente]

    test "deletes chosen cliente", %{conn: conn, cliente: cliente} do
      conn = delete conn, cliente_path(conn, :delete, cliente)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, cliente_path(conn, :show, cliente)
      end
    end
  end

  defp create_cliente(_) do
    cliente = fixture(:cliente)
    {:ok, cliente: cliente}
  end
end
