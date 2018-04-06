defmodule OpenfridayWeb.ContaController do
  use OpenfridayWeb, :controller

  alias Openfriday.Api
  alias Openfriday.Api.Conta

  action_fallback OpenfridayWeb.FallbackController

  def index(conn, _params) do
    contas = Api.list_contas()
    render(conn, "index.json", contas: contas)
  end

  def create(conn, %{"conta" => conta_params}) do
    with {:ok, %Conta{} = conta} <- Api.create_conta(conta_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", conta_path(conn, :show, conta))
      |> render("show.json", conta: conta)
    end
  end

  def show(conn, %{"id" => id}) do
    conta = Api.get_conta!(id)
    render(conn, "show.json", conta: conta)
  end

  def update(conn, %{"id" => id, "conta" => conta_params}) do
    conta = Api.get_conta!(id)

    with {:ok, %Conta{} = conta} <- Api.update_conta(conta, conta_params) do
      render(conn, "show.json", conta: conta)
    end
  end

  def delete(conn, %{"id" => id}) do
    conta = Api.get_conta!(id)
    with {:ok, %Conta{}} <- Api.delete_conta(conta) do
      send_resp(conn, :no_content, "")
    end
  end
end
