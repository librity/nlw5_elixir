defmodule InmanaWeb.RestaurantsViewTest do
  use InmanaWeb.ConnCase, async: true

  import Phoenix.View

  alias Inmana.Restaurant
  alias InmanaWeb.RestaurantsView

  describe "render/2" do
    test "renders create.json" do
      params = %{"name" => "Krusty Krab", "email" => "mr.krabs@kk.yum"}
      {:ok, restaurant} = Inmana.create_restaurant(params)

      return = render(RestaurantsView, "create.json", restaurant: restaurant)

      assert %{
               message: "Restaurant created successfully!",
               restaurant: %Restaurant{
                 email: "mr.krabs@kk.yum",
                 id: _uuid,
                 name: "Krusty Krab"
               }
             } = return
    end
  end
end
