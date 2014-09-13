defmodule NonFP do
  def generate_pockets(chars, probability) do
    :random.seed(:erlang.now())
    Enum.map(chars, fn char ->
      char_to_pocket(char)
    end)
  end

  defp char_to_pocket(?T) do
    Enum.map(1..6, fn _ -> :random.uniform(4) end)
  end

  defp char_to_pocket(?F), do: [0]
end

NonFP.generate_pockets('FTTTTTTTTTTTTTTFTTTTTTTTTTTTTTTT', 0.5)
