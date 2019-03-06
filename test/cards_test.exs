defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_deck makes 52 cards" do
    deck_length = length(Cards.create_deck)
    assert deck_length == 52
  end

  test "shuffle returns a randomized deck" do
    deck = Cards.create_deck
    refute deck == Cards.shuffle(deck)
  end

  test "deal(deck, 1) deals a hand of one card" do
    {hand, _remainder} = Cards.deal(Cards.create_deck, 1)
    hand_length = length(hand)
    assert hand_length == 1
  end

  test "deal(deck, 5) deals a hand of 5 cards" do
    {hand, _remainder} = Cards.deal(Cards.create_deck, 5)
    hand_length = length(hand)
    assert hand_length == 5
  end

  test "deal(deck, 1) remainder deck has 51 cards" do
    {_hand, remainder} = Cards.deal(Cards.create_deck, 1)
    remainder_length = length(remainder)
    assert remainder_length == 51
  end

  test "deal(deck, 7) remainder deck has 45 cards" do
    {_hand, remainder} = Cards.deal(Cards.create_deck, 7)
    remainder_length = length(remainder)
    assert remainder_length == 45
  end

end
