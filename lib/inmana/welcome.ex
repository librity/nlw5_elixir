defmodule Inmana.Welcome do
  def call(%{"name" => name, "age" => age}) do
    name
    |> clean_name()
    |> evaluate(age |> String.to_integer())
  end

  defp evaluate("banana", 42), do: {:ok, "You've just lost the game."}
  defp evaluate(name, age) when age >= 21, do: {:ok, "#{name}, welcome to Inmana 1.0!"}
  defp evaluate(_name, _age), do: {:error, "Naughty naughty..."}

  defp clean_name(name) do
    name
    |> String.trim()
    |> String.downcase()
  end
end
