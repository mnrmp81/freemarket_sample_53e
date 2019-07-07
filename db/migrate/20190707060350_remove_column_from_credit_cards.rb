class RemoveColumnFromCreditCards < ActiveRecord::Migration[5.2]
  def change
    remove_column :credit_cards, :card_number, :integer
    remove_column :credit_cards, :expiration_date, :integer
    remove_column :credit_cards, :expiration_year, :integer
    remove_column :credit_cards, :security_code, :integer
  end
end
