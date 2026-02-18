class Match < ApplicationRecord
  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  validates :winner, presence: true
  validates :loser, presence: true
  validate :winner_and_loser_cannot_be_same

  after_create :update_player_stats

  private

  def winner_and_loser_cannot_be_same
    if winner_id == loser_id
      errors.add(:loser, "cannot be the same as winner")
    end
  end

  def update_player_stats
    winner.increment!(:wins)
    loser.increment!(:losses)
  end
end
