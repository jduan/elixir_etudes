defmodule DatesTest do
  use ExUnit.Case

  test "date_parts/1" do
    assert Dates.date_parts("2013-06-15") == [2013, 6, 15]
  end
end
