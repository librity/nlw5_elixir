defmodule InmanaWeb.WelcomeController do
  use InmanaWeb, :controller

  alias Inmana.Welcomer

  def index(conn, params) do
    params
    |> Welcomer.call()
    |> handle_welcome(conn)
  end

  def handle_welcome({:ok, message}, conn), do: render_welcome(conn, :ok, message)
  def handle_welcome({:error, message}, conn), do: render_welcome(conn, :bad_request, message)

  def render_welcome(conn, status, message) do
    conn
    |> put_status(status)
    |> json(%{message: message})
  end
end
