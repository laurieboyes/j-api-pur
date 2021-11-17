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

    @player1 = @game.players.create
    @player2 = @game.players.create

    raise 'Error saving player1' unless @player1.save
    raise 'Error saving player2' unless @player2.save

    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
  end
end
