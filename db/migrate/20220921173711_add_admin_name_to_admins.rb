class AddAdminNameToAdmins < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :admin_name, :string, null: :default, uniqueness: true
  end
end
