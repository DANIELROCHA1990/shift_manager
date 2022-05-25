class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.datetime :current_day
      t.string :clock_in
      t.string :clock_out
      t.string :all_clock

      t.timestamps
    end
  end
end
