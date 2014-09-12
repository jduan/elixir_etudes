defmodule Powers do
  import Kernel, except: [raise: 2]

  def raise(_, 0), do: 1

  def raise(x, 1), do: x

  def raise(x, n) when n > 0, do: x * raise(x, n - 1)

  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)
end
