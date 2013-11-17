class CreateCauses < ActiveRecord::Migration
  def change
    create_table :causes do |t|
      t.string :name
      t.string :city
      t.string :state
      t.integer :zip
      t.decimal :monthlySponsorship
      t.integer :taxID
      t.string :missionDescription
      t.integer :categoryID
      t.integer :executiveID
      t.integer :contactPhone
      t.string :contactEmail

      t.timestamps
    end
  end
end
