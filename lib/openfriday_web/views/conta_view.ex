defmodule OpenfridayWeb.ContaView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.ContaView

  def render("index.json", %{contas: contas}) do
    %{data: render_many(contas, ContaView, "conta.json")}
  end

  def render("show.json", %{conta: conta}) do
    %{data: render_one(conta, ContaView, "conta.json")}
  end

  def render("conta.json", %{conta: conta}) do
    %{id: conta.id,
      dominio: conta.dominio,
      cliente_id: conta.cliente_id,
      email: conta.email}
  end
end
