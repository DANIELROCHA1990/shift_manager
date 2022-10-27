class AddUserNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :user_name, :string, null: :default, uniqueness: true
  end
end
