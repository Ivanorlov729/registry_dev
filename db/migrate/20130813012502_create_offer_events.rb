class CreateOfferEvents < ActiveRecord::Migration
  def change
    create_table :offer_events do |t|
      t.belongs_to :event
      t.belongs_to :offer

      t.timestamps
    end
    add_index :offer_events, :event_id
    add_index :offer_events, :offer_id
  end
end
