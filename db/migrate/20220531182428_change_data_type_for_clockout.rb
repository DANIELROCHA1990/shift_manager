class ChangeDataTypeForClockout < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :clock_out, :string
    add_column :shifts, :clock_out, :datetime
  end
end
