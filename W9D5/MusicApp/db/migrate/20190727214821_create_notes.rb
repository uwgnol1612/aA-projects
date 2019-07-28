class CreateNotes < ActiveRecord::Migration[5.2]
  def change
    create_table :notes do |t|
      t.integer :user_id, null: false 
      t.integer :track_id, null: false
      t.text :body, null: false  

      t.timestamps
    end
  end
end
