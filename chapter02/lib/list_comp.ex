defmodule ListComp do
  def male_over_40(people) do
    for person = {_name, sex, age} <- people, sex == "M", age > 40 do
      person
    end
  end

  def male_or_40(people) do
    for person = {_name, sex, age} <- people, sex == "M" or age > 40 do
      person
    end
  end
end
