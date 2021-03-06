class BookingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_booking, only: [:show]
  def index
    if (current_user.is_chef && current_user.chef.bookings.empty?) &&   current_user.bookings.empty?  
      redirect_to listings_url, notice: 'You dont have any bookings yet! Check these out!'
    else
      @booking = if current_user.chef
                   current_user.chef.bookings
                 else
                   current_user.bookings.includes(%i[listing chef])
                 end
    end
  end

  def show; end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:id)
  end
end
