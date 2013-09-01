class AddOptionalAddressToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :optional_address, :string
    add_column :orders, :tel_number, :string
    add_column :orders, :is_telephone, :boolean
    add_column :orders, :is_email, :boolean
  end
end
