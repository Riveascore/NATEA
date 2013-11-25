class RemoveWrongFieldsFromPaymentMethods < ActiveRecord::Migration
  def change
    remove_column :payment_methods, :type, :string
    remove_column :payment_methods, :routing_number, :integer
  end
end
