defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test 'create deck makes 20 cards' do
    deck_length = length(Cards.create_deck)
    assert deck_length = 18
  end

  test 'shuffiling a deck randomizes it' do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end
end
