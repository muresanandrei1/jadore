class AddAttachableFieldsToPicture < ActiveRecord::Migration[5.1]
  def change
    add_column :pictures, :attachable_type, :string
    add_column :pictures, :attachable_id, :integer
    remove_column :pictures, :room_id
  end
end
