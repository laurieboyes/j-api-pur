# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :market, Array
  serialize :deck, Array
  after_initialize :init

  def init
    return unless new_record?

    self.rounds_finished = 0
    self.deck = Services::Deck.get_fresh_deck
    self.deck, self.market = Services::Deck.fill_market(deck, Services::Deck::INITIAL_MARKET)
                                           .values_at(:new_deck, :new_market)
    # player1 = new player
    #   roundsWon = 0
    #   hand = 5 from deck
    #   headCount = take any from hand
    #   tokens = []
    # game.tokens = the start tokens

    # save it
  end
end
