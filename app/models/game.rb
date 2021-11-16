# frozen_string_literal: true

class Game < ApplicationRecord
  after_initialize :init

  def init
    self.roundsFinished = 0
  end
end
