defmodule GeomTest do
  use ExUnit.Case

  test "area" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
  end
end
