class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :application_name, null: false, default: 'Magnus'

      t.timestamps
    end
  end
end
