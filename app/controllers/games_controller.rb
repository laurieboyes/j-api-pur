# frozen_string_literal: true

class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new

    raise 'Error saving game' unless @game.save

    @game.create_player
    @game.create_player

    raise 'Error saving game' unless @game.save

    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end
end
