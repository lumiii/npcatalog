class AddLikesToFavourites < ActiveRecord::Migration[5.1]
  def change
    add_column :favourites, :likes, :integer, :null => false, :default => 0
  end
end
