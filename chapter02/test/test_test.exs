defmodule TestTest do
  use ExUnit.Case

  test "defaults values that aren't the last ones in the function definition" do
    assert Test.sum(11, 22, 33) == 66
    assert Test.sum(11, 22) == 40
    assert Test.sum(11) == 21
  end
end
