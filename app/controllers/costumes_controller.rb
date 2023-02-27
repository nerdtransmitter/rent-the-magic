class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show create edit destroy]

  def index
    @costumes = Costume.all
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.save
    redirect_to costume_path(@costume)
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:size, :category, :price, :name, :photo)
  end
end
