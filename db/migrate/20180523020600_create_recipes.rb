class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :recipe_ingredient, index: true, foreign_key: true
      t.text :pic_url
      t.text :ingred
      t.text :description
      t.boolean :cooked, default: false

      t.timestamps
    end
  end
end
