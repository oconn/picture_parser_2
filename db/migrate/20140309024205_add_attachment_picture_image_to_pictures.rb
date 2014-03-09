class AddAttachmentPictureImageToPictures < ActiveRecord::Migration
  def self.up
    change_table :pictures do |t|
      t.attachment :picture_image
    end
  end

  def self.down
    drop_attached_file :pictures, :picture_image
  end
end
