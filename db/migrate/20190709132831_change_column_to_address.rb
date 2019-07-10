class ChangeColumnToAddress < ActiveRecord::Migration[5.2]
  def change
    remove_column :addresses, :prefecture, :string
    add_column :addresses, :prefecture_id, :integer
  end
end
