class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  # def change
  # end
  def up
    change_column :profiles, :profile, :text, null: true
    change_column :profiles, :phone_number, :string, null: true
  end

  def down
    change_column :profiles, :profile, :text, null: false
    change_column :profiles, :phone_number, :string, null: false
  end
end
