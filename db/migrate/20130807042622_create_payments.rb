class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :order
      t.string :first_name
      t.string :last_name
      t.string :ccard_last4
      t.string :card_type
      t.string :exp_year
      t.string :exp_month
      t.string :email
      t.string :address
      t.string :optional_address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :price
      t.string :transaction_id

      t.timestamps
    end
    add_index :payments, :user_id
    add_index :payments, :order_id
  end
end
