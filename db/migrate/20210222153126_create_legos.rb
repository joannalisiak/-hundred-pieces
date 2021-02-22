class CreateLegos < ActiveRecord::Migration[6.0]
  def change
    create_table :legos do |t|
      t.string :name
      t.text :description
      t.integer :pieces
      t.float :price
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
