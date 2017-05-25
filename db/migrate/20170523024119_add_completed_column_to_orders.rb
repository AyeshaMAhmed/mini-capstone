class AddCompletedColumnToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :completed, :boolean, :null => false, :default => false
  end
end
