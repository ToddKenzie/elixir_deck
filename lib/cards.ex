defmodule Cards do
  @moduledoc """
    Methods to create and handle a deck of cards
  """
  # iex -S mix to access iElixir in cmd prompt
  # Ctrl + C OR System.halt() to exit iex


  @doc """
    Returns a list of strings that represent a deck of playing cards
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six"]
    suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
  end

  @doc """
    Randomizes the list of strings that represent a deck of playing cards
  """
  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """
    Verifies if the deck still contains a specific card.
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  
  @doc """
    Divides a deck into a hand and the remainder of the deck.
    The 'hand-size' argument indicates how many cards should be in the hand.
  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end
  
  # Pattern matching... { hand, deck_remainder } = Cards.split(deck, card_amount) 
  # assigns the two variables to each half of the tuple created by the 
  # Enum.split action
  
  @doc """
    Saves a deck of cards to the computer.
  """
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  @doc """
    Loads a deck of cards from the computer.
  """
  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error , _this_variable_name_is_irrelevant } -> "That file does not exist" 
    end
  end

  # Pipe operation example.. 
  # the |> sends the result to the next function as the first parameter

  @doc """
    Runs the create_deck, shuffle, and deal commands all at once.
    The 'hand-size' argument indicates how many cards should be in the hand.
  """
  def create_hand(handsize) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(handsize)
  end


end
