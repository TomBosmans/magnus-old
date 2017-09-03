class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string  :name
      t.string :info

      t.float :latitude
      t.float :longitude
      
      t.references :map, index: true, foreign_key: { to_table: :maps }

      t.timestamps null: false
    end
  end
end
