class ChangeDataTypeForClockin < ActiveRecord::Migration[7.0]
  def change
    remove_column :shifts, :clock_in, :string
    add_column :shifts, :clock_in, :datetime
  end
end
