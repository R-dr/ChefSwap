# frozen_string_literal: true

module ListingsHelper
  def get_chef_bio(listing)
    Chef.find_by(user_id: listing.user.id).bio
  end
end
