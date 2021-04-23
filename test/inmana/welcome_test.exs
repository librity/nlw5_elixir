defmodule Inmana.WelcomeTest do
  use ExUnit.Case, asyn: true

  alias Inmana.Welcome

  describe "call/1" do
    test "should return a welcome when user is of legal age" do
      params = %{"name" => "Example", "age" => "21"}
      return = Welcome.call(params)
      expected = {:ok, "example, welcome to Inmana 1.0!"}

      assert expected == return
    end

    test "should return an special message for a special user" do
      params = %{"name" => "BaNaNA", "age" => "42"}
      return = Welcome.call(params)
      expected = {:ok, "You've just lost the game."}

      assert expected == return
    end

    test "should return an error when user is a minor" do
      params = %{"name" => "Example", "age" => "20"}
      return = Welcome.call(params)
      expected = {:error, "Naughty naughty..."}

      assert expected == return
    end
  end
end
