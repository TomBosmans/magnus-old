class AddAttachmentHeaderImageToSettings < ActiveRecord::Migration
  def self.up
    change_table :settings do |t|
      t.attachment :header_image
    end
  end

  def self.down
    remove_attachment :settings, :header_image
  end
end
