defmodule PowersTest do
  use ExUnit.Case

  test "raise x to n" do
    assert Powers.raise(5, 1) == 5
    assert Powers.raise(2, 3) == 8
    assert Powers.raise(1.2, 3) == 1.728
    assert Powers.raise(2, 0) == 1
    assert Powers.raise(2, -3) == 0.125
  end

  test "raise2 x to n" do
    assert Powers.raise2(5, 1) == 5
    assert Powers.raise2(2, 3) == 8
    assert Powers.raise2(1.2, 3) == 1.728
    assert Powers.raise2(2, 0) == 1
    assert Powers.raise2(2, -3) == 0.125
  end

  test "nth_root" do
    assert Powers.nth_root(27, 3) == 3.0
  end
end
