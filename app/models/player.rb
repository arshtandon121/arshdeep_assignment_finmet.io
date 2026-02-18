class Player < ApplicationRecord
  has_many :won_matches, class_name: 'Match', foreign_key: 'winner_id', dependent: :destroy
  has_many :lost_matches, class_name: 'Match', foreign_key: 'loser_id', dependent: :destroy
  
  validates :name, presence: true, uniqueness: true

  def total_matches
    wins + losses
  end

  def win_rate
    return 0 if total_matches.zero?
    ((wins.to_f / total_matches) * 100).round(2)
  end
end
