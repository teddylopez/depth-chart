class ChartsController < ApplicationController
  before_action :set_chart, only: [:show, :edit, :update, :destroy]
  before_action :get_players, only: [:show, :edit]

  def show

  end

  def edit

  end

  def update
    @chart.position_list = params[:position_list]

    if @chart.save
      render json: @chart
    else
      render json: @chart
    end
  end

  def destroy
    @chart.destroy
    respond_to do |format|
      format.html { redirect_to charts_url, notice: 'Chart was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chart
      @chart = Chart.first
    end

    def get_players
      @players = Player.where(id: @chart.position_list.values.flatten.compact.uniq)
      @players = @players.map { |p| [p.id, p] }.to_h
      @roster = Player.all.order('last_name ASC')
    end
end
