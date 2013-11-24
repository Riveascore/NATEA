class AddDonationRecurrenceToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :donation_recurrence, :string
  end
end
