class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.integer :priority, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
