require "test_helper"

class PlayerTest < ActiveSupport::TestCase
  test "should create player" do
    player = Player.new(name: "John Doe")
    assert player.save
  end

  test "should default wins and losses to 0" do
    player = Player.create(name: "Jane Doe")
    assert_equal 0, player.wins
    assert_equal 0, player.losses
  end

  test "should calculate win rate correctly" do
    player = Player.create(name: "Winner", wins: 10, losses: 5)
    assert_equal 15, player.total_matches
    # 10 / 15 = 0.6666... -> 66.67
    assert_equal 66.67, player.win_rate
  end
end
