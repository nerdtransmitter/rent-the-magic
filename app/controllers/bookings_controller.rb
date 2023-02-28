class BookingsController < ApplicationController
  before_action :set_booking, only: %i[edit update destroy]

  # def index
  #   @bookings = policy_scope(Booking)
  # end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    @booking.user = current_user
    @booking.status = true
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize @booking
  end

  def update
    @booking.update(booking_params)
    authorize @booking
    if @booking.save
      redirect_to dashboard_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
