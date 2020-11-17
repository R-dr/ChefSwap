class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :find_booking!

  def index
    @reviews = @booking.review.order(created_at: :desc)
  end

  def create
    @review = @booking.build_review(review_params)
    @review.user_id = current_user.id
    @review.save

    redirect_to booking_path(@booking)
  end

  private

  def find_booking!
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content, :booking)
  end
end
