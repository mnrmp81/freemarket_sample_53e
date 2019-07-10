class AddDeliveryMethodToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :delivery_method, :integer, null: false
  end
end
