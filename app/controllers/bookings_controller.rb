class BookingsController < ApplicationController
  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.save
    redirect_to costume_booking_path(@booking)
  end

end
