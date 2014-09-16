defmodule Cards do
  def make_deck do
    for letter <- ~w(A 2 3 4 5 6 7 8 9 10 J Q K),
        shape <- ~w(Clubs Diamonds Hearts Spades) do
      {letter, shape}
    end
  end
end
