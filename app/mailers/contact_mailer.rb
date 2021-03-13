class ContactMailer < ApplicationMailer
  def contact_email
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    mail(to: 'mnak81854@gmail.com', subject: 'Thank you')
  end
end
