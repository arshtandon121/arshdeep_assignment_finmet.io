require "test_helper"

class MatchesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player1 = players(:one)
    @player2 = players(:two)
  end

  test "should get index" do
    get matches_url
    assert_response :success
  end

  test "should get new" do
    get new_match_url
    assert_response :success
  end

  test "should create match" do
    assert_difference("Match.count") do
      post matches_url, params: { match: { winner_id: @player1.id, loser_id: @player2.id } }
    end

    assert_redirected_to matches_url
  end
end
