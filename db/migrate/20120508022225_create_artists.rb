class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.string :first_name
      t.string :last_name
      t.string :nickname

      t.string :username, :null => false
      t.string :email,    :null => false
      t.string :password, :null => false, :limit => 40
      t.string :salt,     :null => false, :limit => 3

      t.timestamps
    end
  end
end
