class ChangeArtworks < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite, :integer 
  end
end
