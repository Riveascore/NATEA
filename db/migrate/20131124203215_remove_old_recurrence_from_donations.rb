class RemoveOldRecurrenceFromDonations < ActiveRecord::Migration
  def change
    remove_column :donations, :recurring, :boolean
    remove_column :donations, :recurring_period_months, :integer
  end
end
