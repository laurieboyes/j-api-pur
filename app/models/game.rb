# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :market, Array
  serialize :deck, Array
  has_many :players
  after_initialize :init

  def init
    return unless new_record?

    self.rounds_finished = 0
    self.deck = Services::Deck.get_fresh_deck
    self.deck, self.market = Services::Deck.fill_market(deck, Services::Game::INITIAL_MARKET)
                                           .values_at(:new_deck, :new_market)
  end

  def create_player
    raise 'Tried to create more than two players for a single game' if players.length >= 2

    player = players.create
    player.rounds_won = 0
    player.tokens = {}
    self.deck, player.hand = Services::Deck.take_cards(deck, Services::Game::STARTING_HAND_SIZE).values_at(:new_deck,
                                                                                                           :cards)
    player.herd = 0 # todo
    player
  end
end
