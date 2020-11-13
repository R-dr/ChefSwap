# frozen_string_literal: true

class ListingsController < ApplicationController
  before_action :set_listing, only: %i[show edit update destroy]
  before_action :authenticate_user!
  before_action :authorize_listing, only: %i[new create]
  # GET /listings
  def index
    @listings = Listing.all
  end

  # GET /listings/1
  def show; end

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
        f render :edit
      end
  end

  # DELETE /listings/1
  def destroy
    @listing.destroy
      redirect_to listings_url, notice: 'Listing was successfully destroyed.'
  end

  private

  def authorize_listing
    redirect_to listings_path, notice: 'you must be a chef to access this.' unless current_user.is_chef?
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_listing
    @listing = Listing.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def listing_params
    params.require(:listing).permit(:title, :description, :location, :category_id,:price)
  end
end
