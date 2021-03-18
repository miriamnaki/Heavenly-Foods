class BookingsController < ApplicationController
  def new
    @booking = Booking.new 
  end

  def show
     @booking = Booking.find(params[:id])

  end

  def create
    booking = Booking.new(booking_params.merge(user: current_user))
    if booking.save
      BookingMailer.with(booking: booking).appointment.deliver_now
      flash[:notice] = 'Your table has been saved'
      redirect_to booking_path(booking)

    else
      flash[:danger] = booking.errors.full_messages.to_sentence
      redirect_to new_booking_path
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:num_people,:date,:time)
  end

end
