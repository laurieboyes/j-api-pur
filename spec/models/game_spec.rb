# rubocop:disable Metrics/BlockLength
# frozen_string_literal: true

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
  end

  describe 'create_player' do
    it 'throws an error if there are already two players' do
      game = Game.new
      game.save
      game.create_player
      game.create_player
      expect { game.create_player }.to raise_error('Tried to create more than two players for a single game')
    end

    it 'takes some cards from the deck into the players hand' do
      game = Game.new
      game.save

      deck_before = game.deck

      player = game.create_player

      deck_after = game.deck

      expect(deck_after.length).to eql deck_before.length - 5
      expect(player.hand).to eql deck_before[0, 5]
    end
  end
end
# rubocop:enable Metrics/BlockLength
