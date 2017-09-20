class Api::MoviesController < ApplicationController
  before_action :set_movie!, only: [:show, :update, :destroy, :votes, :watchlist]

  def index
    render json: Movie.all
  end

  def create
    movie = Movie.new(movie_params)
    movie.votes = 1
    movie.save ? (render json: movie) : (render json: {message: movie.errors}, status: 400)
  end

  def show
    render json: @movie
  end

  def update
    @movie.update(movie_params) ? (render json: @movie) : (render json: {message: @movie.errors}, status: 400)
  end

  def destroy
    @movie.destroy ? (render status: 204) : (render json: {message: "Unable to delete movie."}, status: 400)
  end

  def votes
    @movie.votes += 1
    rating = params[:rating].gsub("_",".").to_f
    @movie.rating = rating
    @movie.save
  end

  def watchlist
    @movie.list_id = 1
    @movie.save
  end

  private

  def set_movie!
    @movie = Movie.find_by(id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rating, :mpaa, :votes)
  end
end
