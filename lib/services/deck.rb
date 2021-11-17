# frozen_string_literal: true

module Services
  class Deck
    STARTING_MARKET_CAMELS = 3

    CARD_QUANTITIES = {
      'diamond' => 6,
      'gold' => 6,
      'silver' => 6,
      'cloth' => 8,
      'spice' => 8,
      'leather' => 10,
      'camel' => 11 - STARTING_MARKET_CAMELS
    }.freeze

    def self.get_fresh_deck
      CARD_QUANTITIES
        .reduce([]) { |acc, (card_name, quantity)| acc + Array.new(quantity).fill(card_name) }
        .shuffle
    end
  end
end
