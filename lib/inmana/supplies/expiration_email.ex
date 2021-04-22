defmodule Inmana.Supplies.ExpirationEmail do
  import Bamboo.Email

  alias Inmana.Supply

  def create(to_email, supplies) do
    new_email(
      to: to_email,
      from: "noreply@inmana.com",
      subject: "About to expire notification",
      html_body: "<h1>HTML BODY TEST!</h1>",
      text_body: generate_body(supplies)
    )
  end

  defp generate_body(supplies) do
    body = "--- Supplies that will expire this week ---\n"

    Enum.reduce(supplies, body, &add_supply/2)
  end

  defp add_supply(
        %Supply{
          description: description,
          responsible: responsible,
          expiration_date: expiration_date
        },
        body
      ) do
    body <>
      "Description: #{description}, Responsible: #{responsible}, Expires: #{expiration_date}\n"
  end
end
