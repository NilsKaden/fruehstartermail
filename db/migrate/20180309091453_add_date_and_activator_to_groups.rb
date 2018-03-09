class AddDateAndActivatorToGroups < ActiveRecord::Migration[5.1]
  def change
    add_column :groups, :datum, :date
    add_column :groups, :activator, :boolean
  end
end
