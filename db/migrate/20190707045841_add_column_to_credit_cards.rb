class AddColumnToCreditCards < ActiveRecord::Migration[5.2]
  def change
    add_column :credit_cards, :customer_id, :string, null: false
    add_column :credit_cards, :card_id, :string, null: false
    remove_column :credit_cards, :card_number, :integer
    remove_column :credit_cards, :expiration_date, :integer
    remove_column :credit_cards, :expiration_year, :integer
    remove_column :credit_cards, :security_code, :integer
  end
end
