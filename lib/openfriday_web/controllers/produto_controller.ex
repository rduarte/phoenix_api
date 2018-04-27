defmodule OpenfridayWeb.ProdutoController do
  use OpenfridayWeb, :controller

  alias Openfriday.Api
  alias Openfriday.Api.Produto

  action_fallback OpenfridayWeb.FallbackController

  def index(conn, _params) do
    produtos = Api.list_produtos()
    render(conn, "index.json", produtos: produtos)
  end

  def create(conn, %{"produto" => produto_params}) do
    with {:ok, %Produto{} = produto} <- Api.create_produto(produto_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", produto_path(conn, :show, produto))
      |> render("show.json", produto: produto)
    end
  end

  def show(conn, %{"id" => id}) do
    produto = Api.get_produto!(id)
    render(conn, "show.json", produto: produto)
  end

  def update(conn, %{"id" => id, "produto" => produto_params}) do
    produto = Api.get_produto!(id)

    with {:ok, %Produto{} = produto} <- Api.update_produto(produto, produto_params) do
      render(conn, "show.json", produto: produto)
    end
  end

  def delete(conn, %{"id" => id}) do
    produto = Api.get_produto!(id)
    with {:ok, %Produto{}} <- Api.delete_produto(produto) do
      send_resp(conn, :no_content, "")
    end
  end
end
