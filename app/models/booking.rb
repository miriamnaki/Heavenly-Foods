class Booking < ApplicationRecord
  attr_accessor :date,:time
  belongs_to :user
  before_validation :set_booking_time
  validate :within_business_hours


  private

  def set_booking_time
    if date && time
      self.booking_time = Time.zone.parse("#{date} #{time}")
    end
  end

  def within_business_hours
    if self.booking_time.hour < 9 || self.booking_time.hour > 22
      errors.add(:base, 'Sorry its past time.Please book within our business hours!')
    end
  end

end
