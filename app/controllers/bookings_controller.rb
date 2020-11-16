class BookingsController < ApplicationController
  before_action :authenticate_user!
  #before_action :set_booking
  def index
    
    @booking= current_user.bookings.all
  end

  private
  # def set_booking
  #   @booking = Booking.find(params[:id])
  # end
  # def booking_params
  #   params.require(:booking).permit(:id)
  # end
end
