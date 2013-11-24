class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.integer :donator_id
      t.boolean :main_contact
      t.integer :country_code
      t.integer :area_code
      t.integer :number

      t.timestamps
    end
  end
end
