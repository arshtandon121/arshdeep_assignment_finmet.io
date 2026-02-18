require "test_helper"

class PlayersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @player = players(:one)
  end

  test "should get index" do
    get players_url
    assert_response :success
  end

  test "should create player" do
    assert_difference("Player.count") do
      post players_url, params: { player: { name: "New Player" } }
    end

    assert_redirected_to players_url
  end

  test "should destroy player" do
    assert_difference("Player.count", -1) do
      delete player_url(@player)
    end

    assert_redirected_to players_url
  end
end
