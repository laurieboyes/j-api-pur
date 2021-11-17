# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :game, autosave: true
  serialize :hand, Array
  serialize :tokens, Hash
  after_initialize :init

  def init
    return unless new_record?

    self.rounds_won = 0
    self.hand = []
    self.herd = 0
    self.tokens = {}
  end
end
