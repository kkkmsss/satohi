class CreateFoods < ActiveRecord::Migration[6.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :genre
      t.string :address
      t.text :about
      t.string :image

      t.timestamps
    end
  end
end
