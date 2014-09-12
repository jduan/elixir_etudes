defmodule Stats do
  def minimum([x]), do: x

  def minimum([head|tail]) do
    min(head, minimum(tail))
  end

  def maximum([x]), do: x

  def maximum([head|tail]) do
    max(head, maximum(tail))
  end

  def range(lst), do: [minimum(lst), maximum(lst)]
end
