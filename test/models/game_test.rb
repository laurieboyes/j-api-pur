# frozen_string_literal: true

require 'test_helper'

class GameTest < ActiveSupport::TestCase
  test 'new games start with `roundsFinished` set to zero' do
    game = Game.new
    assert_equal game.roundsFinished, 0
  end
end
