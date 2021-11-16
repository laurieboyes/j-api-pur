# frozen_string_literal: true

require 'services/deck_service'

describe 'Services::DeckService' do
  it 'creates a new deck' do
    expect(Services::DeckService.get_fresh_deck).to eql('lol')
  end
end
