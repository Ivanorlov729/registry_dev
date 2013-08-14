class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.belongs_to :event
      t.string :title
      t.text :summary
      t.text :overview
      t.string :amount
      t.text :details
      t.text :location
      t.text :merchant

      t.timestamps
    end
    add_index :offers, :event_id
  end
end
