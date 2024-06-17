class AddBistroGenreToFoods < ActiveRecord::Migration[6.1]
  def change
    add_column :foods, :bistro_genre, :string
  end
end
