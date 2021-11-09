class MoviesController < ApplicationController
  before_action :set_movie, only: [ :show,:update, :destroy ]

  # GET /movies
  def index

  render json: get_movies.to_json(include: :watchlists)

  end

  # GET /movies/1
  def show
    render json: @movie
  end

  # POST /movies
  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: get_movies, status: :created, location: @movie
    else
      render json: @movies.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /movies/1
  def update
    if @movie.update(movie_params)
      render json: get_movies
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  # DELETE /movies/1
  def destroy
    @movie.destroy
    render json: get_movies
  end

  private
      # so we can up our component state in react with a fresh array
      def get_movies
        Movie.order('id DESC')
      end
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def movie_params
      params.require(:movie).permit(:title, :description, :image, :movie_rating, :release_date, :genre)
    end
end
