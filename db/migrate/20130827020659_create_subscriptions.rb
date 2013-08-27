class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :luxe_registry
      t.belongs_to :user
      t.boolean :subscribe

      t.timestamps
    end
    add_index :subscriptions, :luxe_registry_id
  end
end
