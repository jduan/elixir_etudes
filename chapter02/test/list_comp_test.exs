defmodule ListCompTest do
  use ExUnit.Case

  test "list comprehension and pattern matching" do
    people = [
      {"Federico", "M", 22},
      {"Kim", "F", 45},
      {"Hansa", "F", 30},
      {"Tran", "M", 47},
      {"Cathy", "F", 32},
      {"Elias", "M", 50}
    ]
    assert ListComp.male_over_40(people) == [
      {"Tran", "M", 47},
      {"Elias", "M", 50}
    ]
    assert ListComp.male_or_40(people) == [
      {"Federico", "M", 22},
      {"Kim", "F", 45},
      {"Tran", "M", 47},
      {"Elias", "M", 50}
    ]
  end
end
