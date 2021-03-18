class BookingMailer < ApplicationMailer
  def appointment
    @booking = params[:booking]
    mail(to: 'mnak81854@gmail.com', subject: 'Booking')
  end
end
