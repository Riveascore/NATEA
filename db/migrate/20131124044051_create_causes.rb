class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :zip
      t.decimal :monthly_sponsorship
      t.integer :employer_identification_number
      t.text :mission_description
      t.integer :cause_category_id
      t.integer :executive_id
      t.integer :phone_number_id
      t.string :contact_email

      t.timestamps
    end
  end
end
