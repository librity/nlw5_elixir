defmodule Inmana.Supplies.ExprationNotification do
  alias Inmana.Mailer
  alias Inmana.Supplies.ExpirationEmail
  alias Inmana.Supplies.Get

  def send do
    about_to_expire = Get.by_expiration()

    about_to_expire
    |> Task.async_stream(&send_email/1)
    |> Stream.run()
  end

  defp send_email({to_email, supplies}) do
    to_email
    |> ExpirationEmail.create(supplies)
    |> Mailer.deliver_later!()
  end
end
