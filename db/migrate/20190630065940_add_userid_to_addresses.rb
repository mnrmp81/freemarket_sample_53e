class AddUseridToAddresses < ActiveRecord::Migration[5.2]
  def change
    change_table :addresses do |t|
      t.references :user, foreign_key: true
    end
  end
end
