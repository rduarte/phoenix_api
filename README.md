# Phoenix/Elixir

To install Elixir/Phoenix on Ubuntu

  * `wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb`
  * `sudo apt-get update`
  * `sudo apt-get install esl-erlang`
  * `sudo apt-get install elixir`
  * `mix archive.install https://github.com/phoenixframework/archives/raw/master/phx_new.ez`
  * `sudo apt-get install inotify-tools` 

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
