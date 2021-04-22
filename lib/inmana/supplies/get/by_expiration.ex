defmodule Inmana.Supplies.Get.ByExpiration do
  import Ecto.Query

  alias Inmana.{Repo, Restaurant, Supply}

  def call(today \\ Date.utc_today()) do
    beginning_of_week = Date.beginning_of_week(today)
    end_of_week = Date.end_of_week(today)

    query =
      from supply in Supply,
        where:
          supply.expiration_date >= ^beginning_of_week and supply.expiration_date <= ^end_of_week,
        preload: [:restaurant]

    query
    |> Repo.all()
    |> Enum.group_by(&email/1)
  end

  defp email(%Supply{restaurant: %Restaurant{email: email}}), do: email
end
