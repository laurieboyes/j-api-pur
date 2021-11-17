# frozen_string_literal: true

class Game < ApplicationRecord
  after_initialize :init

  def init
    self.roundsFinished = 0

    deck = Services::Deck.get_fresh_deck
  end
end
