# frozen_string_literal: true

module Services
  class Deck
    def self.get_fresh_deck
      'hello'
    end
  end
end

# define the constants for the cards avaible in the deck

# getNewDeck
#   return an array of strings repping the cards in the shuffled deck, minus the 3 start camels
#
#   for each type of card
#     loop add the right number to the array of strings
#   shuffle the array
#   return it
