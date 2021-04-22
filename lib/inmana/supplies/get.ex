defmodule Inmana.Supplies.Get do
  alias Inmana.Supplies.Get.{ByExpiration, ById}

  defdelegate by_id(uuid), to: ById, as: :call
  defdelegate by_expiration(date \\ Date.utc_today()), to: ByExpiration, as: :call
end
