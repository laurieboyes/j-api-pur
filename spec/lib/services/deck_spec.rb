# frozen_string_literal: true

require 'services/deck'

describe 'Services::Deck' do
  it 'creates a new deck' do
    expect(Services::Deck.get_fresh_deck).to eql('lol')
  end
end
