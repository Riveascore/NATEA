class CreateExecutives < ActiveRecord::Migration
  def change
    create_table :executives do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone_number_id

      t.timestamps
    end
  end
end
