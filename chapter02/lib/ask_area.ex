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

  defp do_area(_shape, :error, _b) do
    "First input isn't a number"
  end

  defp do_area(_shape, _a, :error) do
    "Second input isn't a number"
  end

  defp do_area(shape, a, b) when a > 0 and b > 0 do
    Geom.area(shape, a, b)
  end

  defp do_area(_shape, a, b) when a <= 0 or b <= 0 do
    "Both numbers must be greater than zero"
  end

  defp get_dimension(name1, name2) do
    value1 = String.strip IO.gets("Enter #{name1} > ")
    value2 = String.strip IO.gets("Enter #{name2} > ")
    IO.puts inspect {str_to_number(value1), str_to_number(value2)}
    {str_to_number(value1), str_to_number(value2)}
  end

  defp str_to_number(str) do
    cond do
      Regex.match?(~r/^[+-]?\d+$/, str) -> String.to_integer str
      Regex.match?(~r/^[+-]?\d+\.\d+$/, str) -> String.to_float str
      true -> :error
    end
  end

  defp char_to_shape(str) do
    do_char_to_shape(String.upcase(String.first(str)))
  end

  defp do_char_to_shape("R"), do: :rectangle
  defp do_char_to_shape("T"), do: :triangle
  defp do_char_to_shape("E"), do: :ellipse
  defp do_char_to_shape(_), do: :unknown
end
