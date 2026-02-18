class PlayersController < ApplicationController
  def index
    @player = Player.new
    @players = Player.all.order(created_at: :asc)
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: "Player was successfully created."
    else
      @players = Player.all.order(created_at: :asc)
      flash.now[:alert] = "Error creating player: #{@player.errors.full_messages.join(', ')}"
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @player = Player.find(params[:id])
    @player.destroy
    redirect_to players_path, notice: "Player was successfully deleted."
  end

  private

  def player_params
    params.require(:player).permit(:name)
  end
end
