class AddColumnToCreditcard < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :card_number, :integer, null: false, unique: true
    add_column :credit_cards, :expiration_date, :integer, null: false
    add_column :credit_cards, :expiration_year, :integer, null: false
    add_column :credit_cards, :security_code, :integer, null: false
  end
end
