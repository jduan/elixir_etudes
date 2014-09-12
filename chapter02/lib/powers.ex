defmodule Powers do
  import Kernel, except: [raise: 2, raise: 3]

  def raise(_, 0), do: 1

  def raise(x, 1), do: x

  def raise(x, n) when n > 0, do: x * raise(x, n - 1)

  def raise(x, n) when n < 0, do: 1.0 / raise(x, -n)

  # raise2 is tail recursive
  def raise2(_, 0), do: 1

  def raise2(x, 1), do: x

  def raise2(x, n) when n > 0, do: raise2(x, n, 1)

  def raise2(x, n) when n < 0, do: 1.0 / raise2(x, -n)

  def raise2(_x, 0, acc), do: acc

  def raise2(x, n, acc), do: raise2(x, n - 1, acc * x)

end
