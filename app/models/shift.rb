class Shift < ApplicationRecord
  belongs_to :user

  before_create :set_clock_in

  def set_clock_out
    self.clock_out = DateTime.now
  end

  private

  def set_clock_in
    self.clock_in = DateTime.now
  end
end
