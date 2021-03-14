class ContactController < ApplicationController
  def contact
  end

  def send_email
    ContactMailer.with(email: params[:email], name: params[:name], message: params[:message]).contact_email.deliver_now
    flash[:alert] = 'Thank you for your email'
    redirect_to contact_path
  end

end
