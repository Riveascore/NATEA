class CreateDonations < ActiveRecord::Migration
  def change
    create_table :donations do |t|
      t.integer :donator_id
      t.decimal :donation_amount
      t.datetime :donation_date
      t.boolean :recurring
      t.integer :recurring_period_months
      t.integer :payment_method_id

      t.timestamps
    end
  end
end
