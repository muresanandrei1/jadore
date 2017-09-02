class AddRoomIdToPictures < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :room_id, :integer
  end
end
