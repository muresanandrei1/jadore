class AddLinkToRooms < ActiveRecord::Migration[5.1]
  def change
    add_column :rooms, :link, :string
  end
end
