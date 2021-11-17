# frozen_string_literal: true

# spec/models/auction_spec.rb

require 'rails_helper'

describe Game, type: :model do
  describe 'init' do
    it 'sets rounds_finished to 0' do
      game = Game.new
      expect(game.rounds_finished).to eq 0
    end

    it 'creates the market' do
      game = Game.new
      expect(game.market.is_a?(Array)).to be true
      expect(game.market.length).to eql 5
    end

    # it 'has the expected number of cards in the deck after initialisation'
  end
end
