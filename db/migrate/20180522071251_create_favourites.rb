class CreateFavourites < ActiveRecord::Migration[5.1]
  def change
    create_table :favourites do |t|
      t.string :uri
      t.string :title

      t.timestamps
    end
  end
end
