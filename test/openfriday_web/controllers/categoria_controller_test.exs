defmodule OpenfridayWeb.CategoriaControllerTest do
  use OpenfridayWeb.ConnCase

  alias Openfriday.Api
  alias Openfriday.Api.Categoria

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:categoria) do
    {:ok, categoria} = Api.create_categoria(@create_attrs)
    categoria
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all categorias", %{conn: conn} do
      conn = get conn, categoria_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create categoria" do
    test "renders categoria when data is valid", %{conn: conn} do
      conn = post conn, categoria_path(conn, :create), categoria: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, categoria_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some nome"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, categoria_path(conn, :create), categoria: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update categoria" do
    setup [:create_categoria]

    test "renders categoria when data is valid", %{conn: conn, categoria: %Categoria{id: id} = categoria} do
      conn = put conn, categoria_path(conn, :update, categoria), categoria: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, categoria_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some updated nome"}
    end

    test "renders errors when data is invalid", %{conn: conn, categoria: categoria} do
      conn = put conn, categoria_path(conn, :update, categoria), categoria: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete categoria" do
    setup [:create_categoria]

    test "deletes chosen categoria", %{conn: conn, categoria: categoria} do
      conn = delete conn, categoria_path(conn, :delete, categoria)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, categoria_path(conn, :show, categoria)
      end
    end
  end

  defp create_categoria(_) do
    categoria = fixture(:categoria)
    {:ok, categoria: categoria}
  end
end
