class CreateLists < ActiveRecord::Migration[5.1]
  def change
    create_table :lists do |t|
      t.string :name
      t.integer :group_id
      t.timestamps
    end
  end
end
