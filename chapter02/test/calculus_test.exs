defmodule CalculusTest do
  use ExUnit.Case

  test "derivative" do
    f1 = fn x -> x * x end
    assert Calculus.derivative(f1, 3) == 6.00000049644222599454
    assert Calculus.derivative(fn(x) -> 3 * x * x + 2 * x + 1 end, 5) == 32.00000264769187197089
    assert Calculus.derivative(&:math.sin/1, 0) == 1.0
  end
end
