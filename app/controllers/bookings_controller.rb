class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy approve]

  # def index
  #   @bookings = policy_scope(Booking)
  # end
  def show
  end

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

  def approve
    @booking.update(state: "approved")
    authorize @booking
    if @booking.state == "approved"
      flash[:success] = "Booking successfully approved"
    else
      flash[:error] = "Booking not approved"
    end
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
