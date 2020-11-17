class ListingMailer < ApplicationMailer
  default from: 'Rodney.ditch@hotmail.com'

  def send_new_listing_email(user)
    @user = user
    mail(to: @user.email, subject: 'New listing notification')
  end
end
