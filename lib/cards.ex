defmodule Cards do
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    List.flatten(Enum.map(values, fn x -> Enum.map(suits, fn y -> "#{x} of #{y}" end) end))
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains?(deck, card) do
    Enum.member?(deck, card)
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    File.write(filename, :erlang.term_to_binary(deck))
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, deck } -> :erlang.binary_to_term(deck)
      {:error, _} -> 'Something bad happened'
    end
  end

  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end
end
