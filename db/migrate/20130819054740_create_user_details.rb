class CreateUserDetails < ActiveRecord::Migration
  def change
    create_table :user_details do |t|
      t.belongs_to :user
      t.string :first_name
      t.string :last_name
      t.string :zip_code

      t.timestamps
    end
    add_index :user_details, :user_id
  end
end
