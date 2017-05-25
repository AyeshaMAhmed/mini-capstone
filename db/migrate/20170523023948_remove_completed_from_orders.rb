class RemoveCompletedFromOrders < ActiveRecord::Migration[5.0]
  def change
    remove_column :orders, :completed, :string
  
  end
end
