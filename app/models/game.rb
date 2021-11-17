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
    self.deck, self.market = Services::Deck.fill_market(deck, Services::Deck::INITIAL_MARKET)
                                           .values_at(:new_deck, :new_market)
  end

  def create_player
    return unless players.length < 2

    players.create
  end
end
