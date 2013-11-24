class CreatePaymentMethods < ActiveRecord::Migration
  def change
    create_table :payment_methods do |t|
      t.integer :donator_id
      t.string :type
      t.integer :routing_number
      t.date :expiration_date
      t.integer :billing_address_id
      t.integer :phone_number_id

      t.timestamps
    end
  end
end
