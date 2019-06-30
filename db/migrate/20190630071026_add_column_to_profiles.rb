class AddColumnToProfiles < ActiveRecord::Migration[5.2]
  def up
    add_column :profiles, :profile, :text, null: false
    add_column :profiles, :family_name, :string, null: false
    add_column :profiles, :first_name, :string, null: false
    add_column :profiles, :family_name_kana, :string, null: false
    add_column :profiles, :first_name_kana, :string, null: false
    add_column :profiles, :phone_number, :string, null: false
  end
end
