defmodule Mix.Tasks.ExampleTask do
  use Mix.Task

  def run(_) do
    Mix.Task.run("app.start")

    IO.puts("THIS IS AN EXAMPLE TASK")
  end
end
