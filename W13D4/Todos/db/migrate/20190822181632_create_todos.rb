class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.string :title, null: false
      t.string :body, null: false
      t.string :done, 

      t.timestamps
    end
  end
end
