# frozen_string_literal: true

class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: :home
  before_action :authorize_chef, only: %i[new create]
  # GET /listings
  def index
    @listings = Listing.all.includes([:category,:chef])
  end

  # GET /listings/1
  def show
    @recipes = @listing.chef.recipes.all.includes([image_attachment: :blob])
    @reviews = @listing.chef.reviews.all.includes([:user])
  end

  def home
    @listings = Listing.all.length
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit; end

  # POST /listings
  def create
   
    @listing = Listing.create(listing_params)
    @listing.chef= current_user.chef
    
    ListingMailer.send_new_listing_email(current_user).deliver

    
      if @listing.save
         redirect_to @listing, notice: 'Listing was successfully created.'
      else
         render :new
      end
    
  end
  def get_categories
    @categories = Category.all
   end

  # PATCH/PUT /listings/1
  def update
      if @listing.update(listing_params)
         redirect_to @listing, notice: 'Listing was successfully updated.'
      else
         render :edit
      end
  end
  
def bookings
  @bookings = current_user.bookings.all
end
  # DELETE /listings/1
  def destroy
    @listing.destroy
      redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private

 

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :location, :category_id,:price,:chef_id, :date_available)
  end
end
