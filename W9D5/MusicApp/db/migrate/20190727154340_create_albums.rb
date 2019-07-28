class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false 
      t.date :year, null: false
      t.boolean :live, default: true
      t.integer :band_id, null: false   

      t.timestamps
    end
    add_index :albums, :band_id, unique: true 
  end
end
