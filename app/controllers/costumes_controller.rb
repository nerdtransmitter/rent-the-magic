class CostumesController < ApplicationController
  before_action :set_costume, only: %i[show edit update destroy]

  def index
    @costumes = policy_scope(Costume)
    @markers = @costumes.geocoded.map do |costume|
      {
        lat: costume.latitude,
        lng: costume.longitude,
        info_html: render_to_string(partial: "info", locals: {costume: costume}),
        marker_html: render_to_string(partial: "marker")
      }
    end
  end

  def show
    authorize @costume
    @marker = [{lat: @costume.latitude, lng: @costume.longitude, marker_html: render_to_string(partial: "marker")}]
  end

  def new
    @costume = Costume.new
    authorize @costume
  end


  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    authorize @costume
    if @costume.save
      redirect_to dashboard_path(@costume)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @costume
  end

  def update
    @costume.update(costume_params)
    authorize @costume
    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @costume.destroy
    authorize @costume
    redirect_to costumes_path, status: :see_other
  end

  private

  def set_costume
    @costume = Costume.find(params[:id])
  end

  def costume_params
    params.require(:costume).permit(:size, :category, :price, :name, photos:[], :description)
  end
end
