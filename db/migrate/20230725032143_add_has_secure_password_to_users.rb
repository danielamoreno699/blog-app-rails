class AddHasSecurePasswordToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :has_secure_password, :boolean
  end
end
