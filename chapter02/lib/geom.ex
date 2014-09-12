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

  def area(:rectangle, length, width) when length > 0 and width > 0 do
    length * width
  end

  def area(:triangle, base, height) when base > 0 and height > 0 do
    base * height / 2
  end

  def area(:ellipse, major_radius, minor_radius)
  when major_radius > 0 and minor_radius > 0 do
    :math.pi() * major_radius * minor_radius
  end

  def area2({:rectangle, length, width}) do
    area(:rectangle, length, width)
  end

  def area2({:triangle, length, width}) do
    area(:triangle, length, width)
  end

  def area2({:ellipse, length, width}) do
    area(:ellipse, length, width)
  end

  def area3(shape, a, b) when a > 0 and b > 0 do
    case shape do
      :rectangle -> a * b
      :triangle -> a * b / 2
      :ellipse -> :math.pi() * a * b
    end
  end

end
