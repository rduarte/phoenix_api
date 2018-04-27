defmodule OpenfridayWeb.ProdutoControllerTest do
  use OpenfridayWeb.ConnCase

  alias Openfriday.Api
  alias Openfriday.Api.Produto

  @create_attrs %{nome: "some nome"}
  @update_attrs %{nome: "some updated nome"}
  @invalid_attrs %{nome: nil}

  def fixture(:produto) do
    {:ok, produto} = Api.create_produto(@create_attrs)
    produto
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all produtos", %{conn: conn} do
      conn = get conn, produto_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create produto" do
    test "renders produto when data is valid", %{conn: conn} do
      conn = post conn, produto_path(conn, :create), produto: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, produto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some nome"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, produto_path(conn, :create), produto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update produto" do
    setup [:create_produto]

    test "renders produto when data is valid", %{conn: conn, produto: %Produto{id: id} = produto} do
      conn = put conn, produto_path(conn, :update, produto), produto: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, produto_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some updated nome"}
    end

    test "renders errors when data is invalid", %{conn: conn, produto: produto} do
      conn = put conn, produto_path(conn, :update, produto), produto: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete produto" do
    setup [:create_produto]

    test "deletes chosen produto", %{conn: conn, produto: produto} do
      conn = delete conn, produto_path(conn, :delete, produto)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, produto_path(conn, :show, produto)
      end
    end
  end

  defp create_produto(_) do
    produto = fixture(:produto)
    {:ok, produto: produto}
  end
end
