class CreatePools < ActiveRecord::Migration[5.1]
  def change
    create_table :pools do |t|

      t.timestamps
    end
  end
end
