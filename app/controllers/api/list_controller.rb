class Api::ListController < ApplicationController
  before_action :set_list!, only: [:destroy]

  def index
    render json: List.all
  end

  def create
    list = List.new(list_params)
    list.save ? (render json: list) : (render json: {message: list.errors}, status: 400)
  end

  def destroy
    @list.destroy ? (render status: 204) : (render json: {message: "Unable to delete list."}, status: 400)
  end

  private

  def set_list!
    @list = List.find_by(id: params[:id])
  end

  def movie_params
    params.require(:list).permit(:name)
  end
end
