# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

require 'services/deck'

describe 'Services::Deck' do
  describe 'get_fresh_deck' do
    deck_size = 52 # minus the start camels

    it 'returns an array' do
      expect(Services::Deck.get_fresh_deck.is_a?(Array)).to be true
    end

    it 'returns an array with 52 (55 minus the 3 camels) elements' do
      expect(Services::Deck.get_fresh_deck.length).to eql(deck_size)
    end

    it 'returns an array of card names representing all of the cards in the game, except for the three start camels' do
      check_quantity = lambda { |deck, card_name|
        expect((deck - [card_name]).length).to eql(deck_size - Services::Deck::CARD_QUANTITIES[card_name])
      }

      deck = Services::Deck.get_fresh_deck
      check_quantity.call deck, 'diamond'
      check_quantity.call deck, 'gold'
      check_quantity.call deck, 'silver'
      check_quantity.call deck, 'cloth'
      check_quantity.call deck, 'spice'
      check_quantity.call deck, 'leather'
      check_quantity.call deck, 'camel'
    end

    it 'returns the array shuffled' do
      deck = Services::Deck.get_fresh_deck
      expect(deck[0, 6]).not_to eql %w[diamond diamond diamond diamond diamond diamond]
    end
  end

  describe 'take_cards' do
    it 'returns a hash containing the a new_deck array and a cards array' do
      deck = %w[silver leather camel diamond leather]
      result = Services::Deck.take_cards(deck, 2)
      expect(result.is_a?(Hash)).to be true
      expect(result[:new_deck].is_a?(Array)).to be true
      expect(result[:cards].is_a?(Array)).to be true
    end

    it 'returns new_deck as the same as the old deck but with taken cards remove from the front of the array' do
      deck = %w[silver leather camel diamond leather]
      quantity = 2
      expect(Services::Deck.take_cards(deck, quantity)[:new_deck]).to eql %w[camel diamond leather]
    end

    it 'returns cards as the elements that were removed from the deck' do
      deck = %w[silver leather camel diamond leather]
      quantity = 2
      expect(Services::Deck.take_cards(deck, quantity)[:cards]).to eql %w[silver leather]
    end

    it 'returns new_deck as an empty array if there is an attempt to take more cards than exist' do
      deck = %w[silver leather]
      quantity = 5
      expect(Services::Deck.take_cards(deck, quantity)[:new_deck]).to eql []
    end
  end

  describe 'fill_market' do
    it 'returns an hash containing a new_deck array and a new_market array' do
      deck = %w[silver leather camel diamond leather]
      market = %w[diamond camel gold]

      result = Services::Deck.fill_market(deck, market)
      expect(result.is_a?(Hash)).to be true
      expect(result[:new_deck].is_a?(Array)).to be true
      expect(result[:new_market].is_a?(Array)).to be true
    end

    it 'returns new_deck as the same as the old deck but with the new market cards removed' do
      deck = %w[silver leather camel diamond leather]
      market = %w[diamond camel gold]

      expect(Services::Deck.fill_market(deck, market)[:new_deck]).to eql %w[camel diamond leather]
    end
  end
end
# rubocop:enable Metrics/BlockLength
