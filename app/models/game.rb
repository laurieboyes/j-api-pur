# frozen_string_literal: true

class Game < ApplicationRecord
  serialize :deck, Array
  after_initialize :init

  def init
    return unless new_record?

    self.roundsFinished = 0
    self.deck = Services::Deck.get_fresh_deck

    # market = 3 camels + 2 from deck
    # player1 = new player
    #   roundsWon = 0
    #   hand = 5 from deck
    #   headCount = take any from hand
    #   tokens = []
    # game.tokens = the start tokens

    # save it
  end
end
