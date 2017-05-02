class AddTextToDummy < ActiveRecord::Migration[5.0]
  def change
    add_column :dummies, :text, :string
  end
end
