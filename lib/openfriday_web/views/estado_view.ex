defmodule OpenfridayWeb.EstadoView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.EstadoView

  def render("index.json", %{estados: estados}) do
    %{estados: render_many(estados, EstadoView, "estado.json")}
  end

  def render("show.json", %{estado: estado}) do
    %{estados: render_one(estado, EstadoView, "estado.json")}
  end

  def render("estado.json", %{estado: estado}) do
    %{id: estado.id,
      uf: estado.uf,
      nome: estado.nome}
  end
end
