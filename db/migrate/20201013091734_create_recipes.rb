class CreateRecipes < ActiveRecord::Migration
  def up
    create_table :recipes do |t|
      t.string :recipe_name
      t.string :recipe_ingredients
      t.string :recipe_cook_time
    end
  end
    
  def down
    drop_table :recipes
  end
end
