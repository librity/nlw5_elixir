# Next Level Week 4 - Inmana

An inventory management backend made with Elixir and Phoenix.

## Endpoints

Built-in

- `GET` http://localhost:4000/dashboard/home

## Postgres

Create a new docker container with:

```bash
$ docker run --name postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d postgres
```

## Bash Commands

```bash
# Install Phoenix
$ mix archive.install hex phx_new 1.5.8

# Create a Phoenix API (like rails new)
$ mix phx.new inmana --no-webpack --no-html

# Setup Ecto (database wrapper and query generator) and check database connection (like rails db:setup)
$ mix ecto.setup

# Install dependencies (like bundle install)
$ mix deps.get

# Create config file for credo (linter, like rubocop)
$ mix credo gen.config

# Run credo
$ mix credo

# Start the server (like rails s)
$ mix phx.server

# Interactive Elixir console (like irb)
$ iex

# Phoenix app console (like rails c)
$ iex -S mix

# Runs tests (like bundle exec rspec)
$ mix test

# Create a migration
$ mix ecto.gen.migration create_user_table

# Migrate database
$ mix ecto.migrate

# Drop database
$ mix ecto.drop

# Create database
$ mix ecto.create

# Generate code coverage report
$ mix test --cover

# Generate an HTML code coverage report (just like the coveralls gem)
$ mix coveralls.html
```

## Elixir Commands

## Libs

## Docs

## Resources
