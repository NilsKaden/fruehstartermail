class AddFemaleToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :female, :boolean
  end
end
