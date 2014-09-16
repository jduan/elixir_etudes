defmodule Stats do
  def minimum([head|tail]), do: do_minimum(tail, head)

  defp do_minimum([], min_so_far), do: min_so_far

  defp do_minimum([head|tail], min_so_far) do
    do_minimum(tail, min(head, min_so_far))
  end

  def maximum([head|tail]), do: do_maximum(tail, head)

  defp do_maximum([], max_so_far), do: max_so_far

  defp do_maximum([head|tail], max_so_far) do
    do_maximum(tail, max(head, max_so_far))
  end

  def range(lst), do: [minimum(lst), maximum(lst)]

  def mean(lst) do
    do_sum(lst) / length(lst)
  end

  def stdv(lst) do
    {sum, sum_of_squares} = List.foldl(lst, {0, 0}, fn x, {sum, sum_of_squares} ->
      {x + sum, x * x + sum_of_squares }
    end
    )
    len = length(lst)
    :math.sqrt((len * sum_of_squares - sum * sum) /
               (len * (len - 1)))
  end

  defp do_sum(lst) do
    List.foldl(lst, 0, fn x, acc -> x + acc end)
  end
end
