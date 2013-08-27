class AddLuxeRegistryIdToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :luxe_registry_id, :integer
  end
end
