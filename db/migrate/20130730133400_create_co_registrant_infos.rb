class CreateCoRegistrantInfos < ActiveRecord::Migration
  def change
    create_table :co_registrant_infos do |t|
      t.belongs_to :luxe_registry
      t.string :first_name
      t.string :last_name
      t.boolean :use_regis_addr
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :daytime_phone
      t.string :email

      t.timestamps
    end
  end
end
