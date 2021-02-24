class RenameLocationColumnNameToAddress < ActiveRecord::Migration[6.0]
  def change
    rename_column :legos, :location, :address
  end
end
