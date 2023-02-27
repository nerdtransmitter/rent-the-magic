class BookingsController < ApplicationController
  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    @booking.user = current_user
    @booking.status = true
    @booking.save
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
