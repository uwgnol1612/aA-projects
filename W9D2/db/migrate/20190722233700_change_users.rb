class ChangeUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :name
      t.remove :email
    end
    add_column :users, :username, :string
  end
end
