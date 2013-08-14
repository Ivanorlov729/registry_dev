class CreateRegistrants < ActiveRecord::Migration
  def change
    create_table :registrants do |t|
      t.belongs_to :luxe_registry
      t.string :password
      t.string :password_confirmation
      t.date :before_this_date
      t.boolean :regis_addr1
      t.boolean :regis_addr2
      t.boolean :co_regis_addr1
      t.boolean :co_regis_addr2
      t.boolean :receive_gifts

      t.timestamps
    end
  end
end
