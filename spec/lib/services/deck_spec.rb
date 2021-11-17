# frozen_string_literal: true

require 'services/deck'

describe 'Services::Deck' do
  it 'returns an array of card names representing all of the cards in the game, except for the three start camels' do
    expect(Services::Deck.get_fresh_deck).to eql('lol')
    # get the deck, sort it, and check it’s the same
  end

  it 'returns the array shuffled' do
    # get the deck and assert that it’s not in the same order
  end
end
