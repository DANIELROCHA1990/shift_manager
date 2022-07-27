class RemoveAllClockFromShifts < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :all_clock
  end
end
