class PagesController < ApplicationController
  def home
  end

  def dashboard
    @costumes = current_user.costumes
    @bookings = current_user.bookings
    @requests = []
    @costumes.each do |costume|
      @requests << costume.bookings
    end
  end
end
