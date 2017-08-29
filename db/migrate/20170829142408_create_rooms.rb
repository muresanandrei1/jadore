class CreateRooms < ActiveRecord::Migration[5.1]
  def change
    create_table :rooms do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :facilities

      t.timestamps
    end
  end
end
