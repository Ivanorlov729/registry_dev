class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.belongs_to :user
      t.belongs_to :order
      t.string :first_name
      t.string :last_name
      t.string :card_number
      t.date :exp_date
      t.string :security_code
      t.string :telephone
      t.string :email
      t.string :means_contact_telephone
      t.string :means_contact_email
      t.string :address1
      t.string :address2
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
