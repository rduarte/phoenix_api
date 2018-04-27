defmodule OpenfridayWeb.ClienteView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.ClienteView
  alias OpenfridayWeb.EstadoView

  def render("index.json", %{clientes: clientes}) do
    %{clientes: render_many(clientes, ClienteView, "cliente.json")}
  end

  def render("show.json", %{cliente: cliente}) do
    %{clientes: render_one(cliente, ClienteView, "cliente.json")}
  end

  def render("cliente.json", %{cliente: cliente}) do
    %{id: cliente.id,
      nome: cliente.nome,
      endereco: cliente.endereco,
      cidade: cliente.cidade,
      estado: render_one(cliente.estado, EstadoView, "estado.json")}
  end
end
