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
end
