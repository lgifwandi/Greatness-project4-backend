class WatchlistsController < ApplicationController
  before_action :set_watchlist, only: %i[ show update destroy ]

  # GET /watchlists
  def index
    render json: get_watchlists
  end

  # GET /watchlists/1
  def show
    render json: @watchlist
  end

  # POST /watchlists
  def create
    @watchlist = Watchlist.new(watchlist_params)

    if @watchlist.save
      render json: @watchlist, status: :created, location: @watchlist
    else
      render json: get_watchlists, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /watchlists/1
  def update
    if @watchlist.update(watchlist_params)
      render json: get_watchlist
    else
      render json: @watchlist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /watchlists/1
  def destroy
    @watchlist.destroy
    render json: get_watchlists
  end

  private

      # so we can up our component state in react with a fresh array
      def get_watchlists
        Watchlist.order('created_at DESC')
      end
    # Use callbacks to share common setup or constraints between actions.
    def set_watchlist
      @watchlist = Watchlist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def watchlist_params
      params.require(:watchlist).permit(:completed, :to_watch, :movie_review, :movie_id)
    end
end
