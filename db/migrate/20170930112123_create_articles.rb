class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.references :group_item
      t.references :created_by, foreign_key: { to_table: :users }

      t.string :name
      t.string :description
      t.attachment :thumbnail

      t.timestamps
    end
  end
end
