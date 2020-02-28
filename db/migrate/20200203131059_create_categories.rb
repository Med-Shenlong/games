class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :slug
      t.integer :games_count

      t.timestamps
    end
  end
end
