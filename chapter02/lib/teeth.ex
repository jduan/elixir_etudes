defmodule Teeth do
  def alert(list_of_pockets) do
    Enum.with_index(list_of_pockets)
    |> Enum.filter(fn {pockets, _index} ->
      Enum.max(pockets) >= 4
    end)
    |> Enum.map(fn {_pockets, index} -> index + 1 end)
  end
end
