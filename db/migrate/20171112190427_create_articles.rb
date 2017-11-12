class CreateArticles < ActiveRecord::Migration[5.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.attachment :thumbnail
      t.string :content

      t.timestamps
    end
  end
end
