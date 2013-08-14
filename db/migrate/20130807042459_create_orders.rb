class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.string :balance_amount
      t.string :payment_option
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip_code
      t.string :country
      t.string :method
      t.string :email
      t.string :token_key

      t.timestamps
    end
    add_index :orders, :user_id
  end
end
