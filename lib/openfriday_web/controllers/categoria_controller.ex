defmodule OpenfridayWeb.CategoriaController do
  use OpenfridayWeb, :controller

  alias Openfriday.Api
  alias Openfriday.Api.Categoria

  action_fallback OpenfridayWeb.FallbackController

  def index(conn, _params) do
    categorias = Api.list_categorias()
    render(conn, "index.json", categorias: categorias)
  end

  def create(conn, %{"categoria" => categoria_params}) do
    with {:ok, %Categoria{} = categoria} <- Api.create_categoria(categoria_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", categoria_path(conn, :show, categoria))
      |> render("show.json", categoria: categoria)
    end
  end

  def show(conn, %{"id" => id}) do
    categoria = Api.get_categoria!(id)
    render(conn, "show.json", categoria: categoria)
  end

  def update(conn, %{"id" => id, "categoria" => categoria_params}) do
    categoria = Api.get_categoria!(id)

    with {:ok, %Categoria{} = categoria} <- Api.update_categoria(categoria, categoria_params) do
      render(conn, "show.json", categoria: categoria)
    end
  end

  def delete(conn, %{"id" => id}) do
    categoria = Api.get_categoria!(id)
    with {:ok, %Categoria{}} <- Api.delete_categoria(categoria) do
      send_resp(conn, :no_content, "")
    end
  end
end
