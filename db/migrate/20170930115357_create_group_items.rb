class CreateGroupItems < ActiveRecord::Migration[5.0]
  def change
    create_table :group_items do |t|
      t.references :group
      t.references :groupable, polymorphic: true

      t.timestamps
    end
  end
end
