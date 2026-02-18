require "test_helper"

class MatchTest < ActiveSupport::TestCase
  setup do
    @player1 = players(:one)
    @player2 = players(:two)
  end

  test "should save valid match" do
    match = Match.new(winner: @player1, loser: @player2)
    assert match.save
  end

  test "should require winner and loser" do
    match = Match.new
    assert_not match.save
  end

  test "should not allow same player as winner and loser" do
    match = Match.new(winner: @player1, loser: @player1)
    assert_not match.save
    assert_includes match.errors[:loser], "cannot be the same as winner"
  end

  test "should update player stats after creation" do
    initial_wins_p1 = @player1.wins
    initial_losses_p2 = @player2.losses

    Match.create(winner: @player1, loser: @player2)

    assert_equal initial_wins_p1 + 1, @player1.reload.wins
    assert_equal initial_losses_p2 + 1, @player2.reload.losses
  end
end
