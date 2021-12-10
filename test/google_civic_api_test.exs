defmodule GoogleCivicApiTest do
  use ExUnit.Case
  doctest GoogleCivicApi

  test "greets the world" do
    assert GoogleCivicApi.hello() == :world
  end
end
