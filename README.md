# Phoenix/Elixir

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

# Requisitos e regras de negócio

  * Uma conta possui um cliente e n produtos
  * Um cliente possui código, nome e endereço (cidade e estado)
  * Um produto possui código, nome e categoria
  * Uma categoria possui código e nome
  * Buscar todas as contas de um determinado cliente
  * Buscar todas as contas com clientes de um determinado estado
  * Buscar todas as contas com um determinado produto
  * Buscar todas as contas com produtos de uma determinada categoria

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
