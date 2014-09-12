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

  test "Etude 3-1 area :rectangle" do
    assert Geom.area(:rectangle, 3, 4) == 12
    assert Geom.area(:triangle, 3, 5) == 7.5
    assert Geom.area(:ellipse, 2, 4) == 25.132741228718345
  end

  test "Etude 3-2 area with guards" do
    assert_raise FunctionClauseError, fn ->
      Geom.area(:rectangle, -3, 4)
    end
    assert_raise FunctionClauseError, fn ->
      Geom.area(:triangle, -3, 4)
    end
    assert_raise FunctionClauseError, fn ->
      Geom.area(:ellipse, -3, 4)
    end
  end

  test "Etude 3-4 tuple as parameters" do
    assert Geom.area2({:rectangle, 7, 3}) == 21
    assert Geom.area2({:triangle, 7, 3}) == 10.5
    assert Geom.area2({:ellipse, 7, 3}) == 65.97344572538566
  end

end
