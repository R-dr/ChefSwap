class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show]
  def index
    if current_user.bookings.empty?
      redirect_to listings_url, notice: 'You dont have any bookings yet! Check these out!'
    else
    @booking= Booking.where(user_id:current_user.id).includes([:listing])
    end
  end
def show
end
  private
  def set_booking
    @booking = Booking.find(params[:id])
  end
  def booking_params
    params.require(:booking).permit(:id)
  end
end
