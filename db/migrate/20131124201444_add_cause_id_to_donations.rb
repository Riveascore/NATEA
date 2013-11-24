class AddCauseIdToDonations < ActiveRecord::Migration
  def change
    add_column :donations, :cause_id, :integer
  end
end
