defmodule Calculus do
  def derivative(fun, point) do
    delta = 1.0e-10
    (fun.(point + delta) - fun.(point)) / delta
  end
end
