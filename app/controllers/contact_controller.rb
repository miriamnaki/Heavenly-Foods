class ContactController < ApplicationController
  def contact
  end

  def send_email
    ContactMailer.with(email: params[:email], name: params[:name], message: params[:message]).contact_email.deliver_now
    redirect_to menu_items_path
  end

end
