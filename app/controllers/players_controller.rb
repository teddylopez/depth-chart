class PlayersController < ApplicationController
  before_action :set_player, only: [:show]

  def show
    @players = Player.all

    pp @players
  end

  def set_player
    @player = Player.find(params[:id])
  end

end
