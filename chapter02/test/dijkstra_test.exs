defmodule DijkstraTest do
  use ExUnit.Case

  test "GCD" do
    assert Dijkstra.gcd(2, 8) == 2
    assert Dijkstra.gcd(14, 21) == 7
    assert Dijkstra.gcd(125, 46) == 1
    assert Dijkstra.gcd(120, 36) == 12
  end
end
