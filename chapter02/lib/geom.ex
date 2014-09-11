defmodule Geom do
  @moduledoc """
  Functions for calculating areas of geometric shapes.
  """

  @doc """
  Calculates the area of a rectangle, given the length and width. The default
  value for both arguments is 1.
  """
  def area(length \\ 1, width \\ 1) do
    length * width
  end
end
