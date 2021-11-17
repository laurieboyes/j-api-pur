# frozen_string_literal: true

class Player < ApplicationRecord
  belongs_to :game
  serialize :hand, Array
  serialize :tokens, Hash
end
