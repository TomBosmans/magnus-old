class CreateMaps < ActiveRecord::Migration[5.0]
  def change
    create_table :maps do |t|
      t.string  :name

      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
