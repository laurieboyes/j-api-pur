# frozen_string_literal: true

class PlayersController < ApplicationController
  def show
    @game = Game.find(params[:game_id])
    @player = @game.players.find(params[:id])
  end
end
