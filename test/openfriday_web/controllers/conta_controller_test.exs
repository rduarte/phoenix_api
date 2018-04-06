defmodule OpenfridayWeb.ContaControllerTest do
  use OpenfridayWeb.ConnCase

  alias Openfriday.Api
  alias Openfriday.Api.Conta

  @create_attrs %{cliente_id: 42, dominio: "some dominio", email: "some email"}
  @update_attrs %{cliente_id: 43, dominio: "some updated dominio", email: "some updated email"}
  @invalid_attrs %{cliente_id: nil, dominio: nil, email: nil}

  def fixture(:conta) do
    {:ok, conta} = Api.create_conta(@create_attrs)
    conta
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all contas", %{conn: conn} do
      conn = get conn, conta_path(conn, :index)
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create conta" do
    test "renders conta when data is valid", %{conn: conn} do
      conn = post conn, conta_path(conn, :create), conta: @create_attrs
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get conn, conta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cliente_id" => 42,
        "dominio" => "some dominio",
        "email" => "some email"}
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post conn, conta_path(conn, :create), conta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update conta" do
    setup [:create_conta]

    test "renders conta when data is valid", %{conn: conn, conta: %Conta{id: id} = conta} do
      conn = put conn, conta_path(conn, :update, conta), conta: @update_attrs
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get conn, conta_path(conn, :show, id)
      assert json_response(conn, 200)["data"] == %{
        "id" => id,
        "cliente_id" => 43,
        "dominio" => "some updated dominio",
        "email" => "some updated email"}
    end

    test "renders errors when data is invalid", %{conn: conn, conta: conta} do
      conn = put conn, conta_path(conn, :update, conta), conta: @invalid_attrs
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete conta" do
    setup [:create_conta]

    test "deletes chosen conta", %{conn: conn, conta: conta} do
      conn = delete conn, conta_path(conn, :delete, conta)
      assert response(conn, 204)
      assert_error_sent 404, fn ->
        get conn, conta_path(conn, :show, conta)
      end
    end
  end

  defp create_conta(_) do
    conta = fixture(:conta)
    {:ok, conta: conta}
  end
end
