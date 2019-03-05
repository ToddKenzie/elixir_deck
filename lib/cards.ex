defmodule Cards do
  @moduledoc """
  Documentation for Cards.
  """

  @doc """

  """
  # iex -S mix to access iElixir in cmd prompt
  # Ctrl + C OR System.halt() to exit iex


  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five", "Six"]
    suits = ["Hearts", "Clubs", "Spades", "Diamonds"]

    for suit <- suits, value <- values do
        "#{value} of #{suit}"
    end
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
  
  # Pattern matching... { hand, deck_remainder } = Cards.split(deck, card_amount) 
  # assigns the two variables to each half of the tuple created by the 
  # Enum.split action
  
  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      { :ok, binary } -> :erlang.binary_to_term(binary)
      { :error , _this_variable_name_is_irrelevant } -> "That file does not exist" 
    end
  end


end
