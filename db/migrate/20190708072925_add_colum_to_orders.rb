class AddColumToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :charge_id, :string, null: false
  end
end
