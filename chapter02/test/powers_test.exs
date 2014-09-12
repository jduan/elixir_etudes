defmodule PowersTest do
  use ExUnit.Case

  test "raise x to n" do
    assert Powers.raise(5, 1) == 5
    assert Powers.raise(2, 3) == 8
    assert Powers.raise(1.2, 3) == 1.728
    assert Powers.raise(2, 0) == 1
    assert Powers.raise(2, -3) == 0.125
  end
end