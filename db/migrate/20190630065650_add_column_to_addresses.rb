class AddColumnToAddresses < ActiveRecord::Migration[5.2]
  def up
    add_column :addresses, :postal_code, :string, null: false
    add_column :addresses,:prefecture, :string, null: false
    add_column :addresses,:city, :string, null: false
    add_column :addresses,:block, :string, null: false
    add_column :addresses,:building, :string, null: false
  end
end
