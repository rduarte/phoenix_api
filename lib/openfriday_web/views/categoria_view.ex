defmodule OpenfridayWeb.CategoriaView do
  use OpenfridayWeb, :view
  alias OpenfridayWeb.CategoriaView
  alias OpenfridayWeb.ProdutoView

  def render("index.json", %{categorias: categorias}) do
    %{categorias: render_many(categorias, CategoriaView, "categoria.json")}
  end

  def render("show.json", %{categoria: categoria}) do
    %{categorias: render_one(categoria, CategoriaView, "categoria.json")}
  end

  def render("categoria.json", %{categoria: categoria}) do
    %{id: categoria.id,
      nome: categoria.nome,
      produtos: render_many(categoria.produtos, ProdutoView, "produto.json")
    }
  end
end
