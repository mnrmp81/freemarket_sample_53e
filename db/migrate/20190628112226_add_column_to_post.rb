class AddColumnToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :product_name, :string, null: false
    add_column :posts, :product_description, :text, null: false
    add_column :posts, :first_category_id, :integer, null: false
    add_column :posts, :second_category_id, :integer, null: false
    add_column :posts, :third_category_id, :integer
    add_column :posts, :product_size, :integer
    add_column :posts, :product_condition, :integer, null: false
    add_column :posts, :delivery_fee, :integer, null: false
    add_column :posts, :delivery_former_area, :string, null: false
    add_column :posts, :delivery_date, :integer, null: false
    add_column :posts, :product_price, :integer, null: false
    add_column :posts, :product_status, :integer, null: false
  end
end
