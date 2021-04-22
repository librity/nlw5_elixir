defmodule Inmana.Supplies.ExprationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.Get
  alias Inmana.Supplies.ExpirationEmail

  def send do
    Get.by_expiration()
    |> Enum.each(fn {to_email, supplies} ->
      to_email
      |> ExpirationEmail.create(supplies)
      |> Mailer.deliver_later!()
    end)
  end
end
