# frozen_string_literal: true

require 'services/deck'

describe 'Services::Deck' do
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
