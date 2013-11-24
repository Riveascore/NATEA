class AddCauseImageToCauses < ActiveRecord::Migration
  def change
    add_column :causes, :cause_image, :string
  end
end
