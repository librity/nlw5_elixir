defmodule InmanaWeb.RestaurantsControllerTest do
  use InmanaWeb.ConnCase, async: true

  describe "create/2" do
    test "returns a user when params are valid", %{conn: conn} do
      params = %{"name" => "Krusty Krab", "email" => "mr.krabs@kk.yum"}

      route = Routes.restaurants_path(conn, :create, params)

      response =
        conn
        |> post(route)
        |> json_response(:created)

      assert %{
               "message" => "Restaurant created successfully!",
               "restaurant" => %{
                 "email" => "mr.krabs@kk.yum",
                 "id" => _uuid,
                 "name" => "Krusty Krab"
               }
             } = response
    end

    test "returns an error when params invalid", %{conn: conn} do
      params = %{"name" => "K", "email" => "mr.krabsatkk.yum"}

      route = Routes.restaurants_path(conn, :create, params)

      response =
        conn
        |> post(route)
        |> json_response(:bad_request)

      expected = %{
        "message" => %{
          "email" => ["has invalid format"],
          "name" => ["should be at least 2 character(s)"]
        }
      }

      assert expected == response
    end
  end
end
