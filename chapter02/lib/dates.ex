defmodule Dates do
  def date_parts(date_str) do
    String.split(date_str, "-")
    |> Enum.map(&(String.to_integer &1))
  end
end
