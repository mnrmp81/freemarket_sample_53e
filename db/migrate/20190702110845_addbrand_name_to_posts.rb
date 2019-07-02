class AddbrandNameToPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :brand_name, :string
  end
end
