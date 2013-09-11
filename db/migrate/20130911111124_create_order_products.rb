class CreateOrderProducts < ActiveRecord::Migration
  def change
    create_table :order_products do |t|
      t.belongs_to :order
      t.belongs_to :offer

      t.timestamps
    end
    add_index :order_products, :order_id
    add_index :order_products, :offer_id
  end
end
