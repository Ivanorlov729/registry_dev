class CreateLuxeRegistries < ActiveRecord::Migration
  def change
    create_table :luxe_registries do |t|
      t.belongs_to :event
      t.belongs_to :user
      t.date :event_date
      t.string :first_name
      t.string :last_name
      t.string :phone

      t.timestamps
    end
    add_index :luxe_registries, :event_id
  end
end
