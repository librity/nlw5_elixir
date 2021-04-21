defmodule Inmana.Supplies.Get do
  alias Inmana.{Repo, Supply}

  def by_id(uuid) do
    case Repo.get(Supply, uuid) do
      nil -> {:error, %{result: "Supply not found", status: :not_found}}
      %Supply{} = supply -> {:ok, supply}
    end
  end
end
