class PagesController < ApplicationController
  def home
  end

  def dashboard
    @costumes = current_user.costumes
    @bookings = current_user.bookings
  end



  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
