class PagesController < ApplicationController
  def home
  end

  def dashboard
    @costumes = current_user.costumes
    @bookings = current_user.bookings
  end
end
