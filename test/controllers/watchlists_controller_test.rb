require "test_helper"

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @watchlist = watchlists(:one)
  end

  test "should get index" do
    get watchlists_url, as: :json
    assert_response :success
  end

  test "should create watchlist" do
    assert_difference("Watchlist.count") do
      post watchlists_url, params: { watchlist: { completed: @watchlist.completed, movie_id: @watchlist.movie_id, movie_review: @watchlist.movie_review, to_watch: @watchlist.to_watch } }, as: :json
    end

    assert_response :created
  end

  test "should show watchlist" do
    get watchlist_url(@watchlist), as: :json
    assert_response :success
  end

  test "should update watchlist" do
    patch watchlist_url(@watchlist), params: { watchlist: { completed: @watchlist.completed, movie_id: @watchlist.movie_id, movie_review: @watchlist.movie_review, to_watch: @watchlist.to_watch } }, as: :json
    assert_response :success
  end

  test "should destroy watchlist" do
    assert_difference("Watchlist.count", -1) do
      delete watchlist_url(@watchlist), as: :json
    end

    assert_response :no_content
  end
end
