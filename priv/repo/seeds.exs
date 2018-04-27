# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Openfriday.Repo.insert!(%Openfriday.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Openfriday.Repo

sc = Openfriday.Repo.insert!(%Openfriday.Api.Estado{
    uf: "SC",
    nome: "Santa Catarina"
})
rs = Openfriday.Repo.insert!(%Openfriday.Api.Estado{
    uf: "RS",
    nome: "Rio Grande do Sul"
})
pr = Openfriday.Repo.insert!(%Openfriday.Api.Estado{
    uf: "PR",
    nome: "Paraná"
})
jao = Openfriday.Repo.insert!(%Openfriday.Api.Cliente{
    nome: "Jão da Silva",
    endereco: "Rua Pontes",
    cidade: "Tubarão",
    estado_id: sc.id
})
lula = Openfriday.Repo.insert!(%Openfriday.Api.Cliente{
    nome: "Luiz Inácio da Silva",
    endereco: "Av. Corsair",
    cidade: "Curitiba",
    estado_id: pr.id
})
everton = Openfriday.Repo.insert!(%Openfriday.Api.Cliente{
    nome: "Everton",
    endereco: "Rua Farroupilha",
    cidade: "Porto Alegre",
    estado_id: rs.id
})

cat1 = Openfriday.Repo.insert!(%Openfriday.Api.Categoria{
    nome: "Categoria 1"
})
cat2 = Openfriday.Repo.insert!(%Openfriday.Api.Categoria{
    nome: "Categoria 2"
})

prod1 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 1",
    categoria_id: cat1.id
}) |> Repo.preload(:contas)
prod2 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 2",
    categoria_id: cat1.id
}) |> Repo.preload(:contas)
prod3 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 3",
    categoria_id: cat1.id
}) |> Repo.preload(:contas)
prod4 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 4",
    categoria_id: cat1.id
}) |> Repo.preload(:contas)
prod5 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 5",
    categoria_id: cat2.id
}) |> Repo.preload(:contas)
prod6 = Openfriday.Repo.insert!(%Openfriday.Api.Produto{
    nome: "Produto 6",
    categoria_id: cat2.id
}) |> Repo.preload(:contas)

conta1 = Openfriday.Repo.insert!(%Openfriday.Api.Conta{
    numero: "NF 123/1",
    cliente_id: everton.id
}) |> Openfriday.Repo.preload(:produtos)
conta2 = Openfriday.Repo.insert!(%Openfriday.Api.Conta{
    numero: "NF 456/1",
    cliente_id: jao.id
}) |> Repo.preload(:produtos)
conta3 = Openfriday.Repo.insert!(%Openfriday.Api.Conta{
    numero: "NF 789/1",
    cliente_id: jao.id
}) |> Repo.preload(:produtos)

#prod1 = Openfriday.Repo.preload(prod1,:contas)
#prod2 = Openfriday.Repo.preload(prod2,:contas)
#prod3 = Openfriday.Repo.preload(prod3,:contas)


changeset = Ecto.Changeset.change(prod1) |> Ecto.Changeset.put_assoc(:contas, [conta1])
Repo.update!(changeset)
