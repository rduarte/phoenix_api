defmodule OpenfridayWeb.ClienteController do
  use OpenfridayWeb, :controller

  alias Openfriday.Api
  alias Openfriday.Api.Cliente

  action_fallback OpenfridayWeb.FallbackController

  def index(conn, _params) do
    clientes = Api.list_clientes()
    render(conn, "index.json", clientes: clientes)
  end

  def create(conn, %{"cliente" => cliente_params}) do
    with {:ok, %Cliente{} = cliente} <- Api.create_cliente(cliente_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", cliente_path(conn, :show, cliente))
      |> render("show.json", cliente: cliente)
    end
  end

  def show(conn, %{"id" => id}) do
    cliente = Api.get_cliente!(id)
    render(conn, "show.json", cliente: cliente)
  end

  def update(conn, %{"id" => id, "cliente" => cliente_params}) do
    cliente = Api.get_cliente!(id)

    with {:ok, %Cliente{} = cliente} <- Api.update_cliente(cliente, cliente_params) do
      render(conn, "show.json", cliente: cliente)
    end
  end

  def delete(conn, %{"id" => id}) do
    cliente = Api.get_cliente!(id)
    with {:ok, %Cliente{}} <- Api.delete_cliente(cliente) do
      send_resp(conn, :no_content, "")
    end
  end
end
