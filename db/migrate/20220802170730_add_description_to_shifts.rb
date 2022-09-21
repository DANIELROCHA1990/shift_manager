class AddDescriptionToShifts < ActiveRecord::Migration[7.0]
  def change
    add_column :shifts, :description, :string, null: :default
  end
end
