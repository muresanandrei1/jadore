class AddAttachmentPhotoToRooms < ActiveRecord::Migration[5.1]
  def self.up
    change_table :rooms do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :rooms, :photo
  end
end
