class ChangeColumnToPost < ActiveRecord::Migration[5.2]
  def change
    change_column :posts, :product_status, :integer, default: 0
  end
end
