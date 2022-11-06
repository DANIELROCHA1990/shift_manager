class RemoveCurrentDayFromShifts < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :current_day
  end
end
