class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :user_id
      t.integer :list_id
      t.integer :status, :default => 0

      t.timestamps
    end
  end
end
