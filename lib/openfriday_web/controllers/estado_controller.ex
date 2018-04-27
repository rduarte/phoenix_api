defmodule OpenfridayWeb.EstadoController do
  use OpenfridayWeb, :controller

  alias Openfriday.Api
  alias Openfriday.Api.Estado

  action_fallback OpenfridayWeb.FallbackController

  def index(conn, _params) do
    estados = Api.list_estados()
    render(conn, "index.json", estados: estados)
  end

  def create(conn, %{"estado" => estado_params}) do
    with {:ok, %Estado{} = estado} <- Api.create_estado(estado_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", estado_path(conn, :show, estado))
      |> render("show.json", estado: estado)
    end
  end

  def show(conn, %{"id" => id}) do
    estado = Api.get_estado!(id)
    render(conn, "show.json", estado: estado)
  end

  def update(conn, %{"id" => id, "estado" => estado_params}) do
    estado = Api.get_estado!(id)

    with {:ok, %Estado{} = estado} <- Api.update_estado(estado, estado_params) do
      render(conn, "show.json", estado: estado)
    end
  end

  def delete(conn, %{"id" => id}) do
    estado = Api.get_estado!(id)
    with {:ok, %Estado{}} <- Api.delete_estado(estado) do
      send_resp(conn, :no_content, "")
    end
  end
end
