class AddUseridToCreditcard < ActiveRecord::Migration[5.2]
  def change
    change_table :credit_cards do |t|
      t.references :user, foreign_key: true
    end
  end
end
