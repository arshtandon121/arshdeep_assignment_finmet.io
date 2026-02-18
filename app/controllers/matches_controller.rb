class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:winner, :loser).order(created_at: :desc)
  end

  def new
    @match = Match.new
    @players = Player.all.order(:name)
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path, notice: "Match was successfully recorded."
    else
      @players = Player.all.order(:name)
      flash.now[:alert] = "Error recording match: #{@match.errors.full_messages.join(', ')}"
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:winner_id, :loser_id)
  end
end
