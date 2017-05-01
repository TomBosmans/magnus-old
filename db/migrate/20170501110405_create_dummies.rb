class CreateDummies < ActiveRecord::Migration[5.0]
  def change
    create_table :dummies do |t|
      t.integer :position
      t.string :name

      t.timestamps
    end
  end
end
