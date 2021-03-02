class BookingsController < ApplicationController
  def new
    @booking = Booking.new 
  end

  def create
    booking = Booking.new(booking_params.merge(user: current_user))
    if booking.save
      redirect_to root_path

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
