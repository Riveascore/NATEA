class AddNameOnCardAndCreditCardNumberAndSecurityCodeToPaymentMethods < ActiveRecord::Migration
  def change
    add_column :payment_methods, :name_on_card, :string
    add_column :payment_methods, :credit_card_number, :string
    add_column :payment_methods, :security_code, :integer
    add_column :payment_methods, :email, :string
  end
end
