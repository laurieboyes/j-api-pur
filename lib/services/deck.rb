# frozen_string_literal: true

module Services
  class Deck
    STARTING_MARKET_CAMELS = 3
    MARKET_SIZE = 5
    INITIAL_MARKET = %w[camel camel camel].freeze

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

    def self.fill_market(deck, market)
      new_deck, cards = take_cards(deck, MARKET_SIZE - market.length).values_at(:new_deck, :cards)
      { new_deck: new_deck, new_market: market + cards }
    end

    def self.take_cards(deck, quantity)
      if quantity > deck.length
        { new_deck: [], cards: deck }
      else
        { new_deck: deck[quantity..], cards: deck[0, quantity] }
      end
    end
  end
end
