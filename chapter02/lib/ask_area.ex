defmodule AskArea do
  def area do
    input = IO.gets "R)ectangle, T)riangle, or E)llipse: "
    shape = char_to_shape(input)

    do_shape(shape)
  end

  defp do_shape(:rectangle) do
    {width, height} = get_dimension("width", "height")
    do_area(:rectangle, width, height)
  end

  defp do_shape(:triangle) do
    {base, height} = get_dimension("base", "height")
    do_area(:triangle, base, height)
  end

  defp do_shape(:ellipse) do
    {major, minor} = get_dimension("major radius", "minor radius")
    do_area(:ellipse, major, minor)
  end

  defp do_shape(w), do: "Unknown shape #{w}"

  defp do_area(shape, a, b) when a > 0 and b > 0 do
    Geom.area(shape, a, b)
  end

  defp do_area(_shape, _a, _b) do
    "Both numbers must be greater than zero"
  end

  defp get_dimension(name1, name2) do
    value1 = String.to_integer String.strip IO.gets("Enter #{name1} > ")
    value2 = String.to_integer String.strip IO.gets("Enter #{name2} > ")
    {value1, value2}
  end

  defp char_to_shape(str) do
    do_char_to_shape(String.upcase(String.first(str)))
  end

  defp do_char_to_shape("R"), do: :rectangle
  defp do_char_to_shape("T"), do: :triangle
  defp do_char_to_shape("E"), do: :ellipse
  defp do_char_to_shape(_), do: :unknown
end
