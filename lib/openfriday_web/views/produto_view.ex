defmodule OpenfridayWeb.ProdutoView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.ProdutoView
  alias OpenfridayWeb.CategoriaView

  def render("index.json", %{produtos: produtos}) do
    %{produtos: render_many(produtos, ProdutoView, "produto.json")}
  end

  def render("show.json", %{produto: produto}) do
    %{produtos: render_one(produto, ProdutoView, "produto.json")}
  end

  def render("produto.json", %{produto: produto}) do
    %{id: produto.id,
      nome: produto.nome
    }
  end
end
