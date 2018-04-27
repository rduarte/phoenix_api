defmodule OpenfridayWeb.ContaView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.ContaView
  alias OpenfridayWeb.ClienteView

  def render("index.json", %{contas: contas}) do
    %{contas: render_many(contas, ContaView, "conta.json")}
  end

  def render("show.json", %{conta: conta}) do
    %{contas: render_one(conta, ContaView, "conta.json")}
  end

  def render("conta.json", %{conta: conta}) do
    %{id: conta.id,
      cliente: render_one(conta.cliente, ClienteView, "cliente.json"),
      numero: conta.numero}
  end
end
