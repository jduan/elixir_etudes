defmodule Dates do
  @days_in_months [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  @days_in_months_leap_year [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

  def date_parts(date_str) do
    String.split(date_str, "-")
    |> Enum.map(&(String.to_integer &1))
  end

  def julian(date_str) do
    [year, month, day] = date_parts(date_str)
    if is_leap(year) do
      months_list = @days_in_months_leap_year
    else
      months_list = @days_in_months
    end

    # do_months(month - 1, months_list, 0) + day
    do_months2(month - 1, months_list) + day
  end

  defp is_leap(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

  # TODO: the calculated data should be cached so future call of the same month
  # can be fetched directly from the cache
  defp do_months(0, days_in_months, acc), do: acc
  defp do_months(month, days_in_months, acc) do
    [head|tail] = days_in_months
    do_months(month - 1, tail, acc + head)
  end

  defp do_months2(month, days_in_months) do
    {months, _} = Enum.split(days_in_months, month)
    List.foldl(months, 0, fn x, acc -> x + acc end)
  end
end
