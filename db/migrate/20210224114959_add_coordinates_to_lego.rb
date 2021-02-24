class AddCoordinatesToLego < ActiveRecord::Migration[6.0]
  def change
    add_column :legos, :latitude, :float
    add_column :legos, :longitude, :float
  end
end
