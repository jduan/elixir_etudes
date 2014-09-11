defmodule GeomTest do
  use ExUnit.Case

  test "Etude 2-1 area" do
    assert Geom.area(3, 4) == 12
    assert Geom.area(12, 7) == 84
  end

  test "Etude 2-2 area with default values" do
    assert Geom.area(7, 5) == 35
    assert Geom.area(7) == 7
    assert Geom.area() == 1
  end

end
