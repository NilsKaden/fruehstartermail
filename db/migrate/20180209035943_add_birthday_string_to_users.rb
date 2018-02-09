class AddBirthdayStringToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :birthday_string, :string
  end
end
