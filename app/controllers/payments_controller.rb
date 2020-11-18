class PaymentsController < ApplicationController
  before_action :authenticate_user!, except: [:webhook]
  skip_before_action :verify_authenticity_token, only: %i[create webhook]

  def create
    listing = Listing.find(params[:id])
    session = Stripe::Checkout::Session.create({
                                                 payment_method_types: ['card'],
                                                 line_items: [{
                                                   price_data: {
                                                     unit_amount: (listing.price * 100),
                                                     currency: 'aud',
                                                     product_data: {
                                                       name: listing.title
                                                     }
                                                   },
                                                   quantity: 1
                                                 }],
                                                 mode: 'payment',
                                                 success_url: "#{root_url}payments/success?listing_id=#{listing.id}",
                                                 cancel_url: "#{root_url}payments/cancel"
                                               })
    render json: { id: session.id }
  end

  def webhook
    endpoint_secret = Rails.application.credentials.dig(:stripe, :endpoint_secret)
    begin
      sig_header = request.env['HTTP_STRIPE_SIGNATURE']
      payload = request.body.read
      event = Stripe::Webhook.construct_event(payload, sig_header, endpoint_secret)
    rescue JSON::ParserError => e
      # Invalid payload
      head 400
    rescue Stripe::SignatureVerificationError => e
      # Invalid signature
      head 400
    end
    case event['type']
    when 'checkout.session.completed'
      checkout_session = event['data']['object']
      # write to the database to confirm that a listing has actually been sold
    when 'checkout.session.async_payment_failed'
      # write to the database that a listing is still available
      # reach out to the customer to say that the payment was unsuccessful
    end
  end

  def success
    @listing = Listing.find(params[:listing_id])
    b = Booking.create(listing: @listing, user: current_user, chef: @listing.chef)
    @listing.booked = true
    @listing.save
  end

  def cancel; end
end
