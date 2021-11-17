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

    @game.create_player.save
    @game.create_player.save

    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end
end
