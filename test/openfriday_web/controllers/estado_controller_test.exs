defmodule OpenfridayWeb.EstadoControllerTest do
  use OpenfridayWeb.ConnCase

  alias Openfriday.Api
  alias Openfriday.Api.Estado

  @create_attrs %{nome: "some nome", uf: "some uf"}
  @update_attrs %{nome: "some updated nome", uf: "some updated uf"}
  @invalid_attrs %{nome: nil, uf: nil}

  def fixture(:estado) do
    {:ok, estado} = Api.create_estado(@create_attrs)
    estado
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all estados", %{conn: conn} do
      conn = get conn, estado_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create estado" do
    test "renders estado when data is valid", %{conn: conn} do
      conn = post conn, estado_path(conn, :create), estado: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, estado_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some nome",
        "uf" => "some uf"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, estado_path(conn, :create), estado: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update estado" do
    setup [:create_estado]

    test "renders estado when data is valid", %{conn: conn, estado: %Estado{id: id} = estado} do
      conn = put conn, estado_path(conn, :update, estado), estado: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, estado_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "nome" => "some updated nome",
        "uf" => "some updated uf"}
    end

    test "renders errors when data is invalid", %{conn: conn, estado: estado} do
      conn = put conn, estado_path(conn, :update, estado), estado: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete estado" do
    setup [:create_estado]

    test "deletes chosen estado", %{conn: conn, estado: estado} do
      conn = delete conn, estado_path(conn, :delete, estado)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, estado_path(conn, :show, estado)
      end
    end
  end

  defp create_estado(_) do
    estado = fixture(:estado)
    {:ok, estado: estado}
  end
end
