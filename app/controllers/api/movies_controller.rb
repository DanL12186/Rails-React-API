class Api::MoviesController < ApplicationController
  before_action :set_movie!, only: [:show, :update, :destroy]

  def index
    render json: Movie.all
  end

  def create
    movie = Movie.new(movie_params)
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

  private

  def set_movie!
    @movie = Movie.find_by(id: params[:id])
  end

  def movie_params
    params.require(:movie).permit(:title, :year, :rating, :mpaa, :votes)
  end
end
