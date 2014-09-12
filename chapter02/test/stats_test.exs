defmodule StatsTest do
  use ExUnit.Case

  test "test States" do
    data = [4, 1, 7, -17, 8, 2, 5]
    assert Stats.minimum(data) == -17
    assert Stats.minimum([52, 46]) == 46
    assert Stats.maximum(data) == 8
    assert Stats.maximum([52, 46]) == 52
    assert Stats.range(data) == [-17, 8]
  end
end
