class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      
      t.string :name
      t.string :password
      t.string :summary
      t.text :description
      t.integer :hit
      t.integer :view

      t.timestamps null: false
    end
  end
end
