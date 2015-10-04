class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      
      t.string :name
      t.string :password
      t.string :summary
      t.text :description
      t.integer :like, default: 0
      t.integer :view, default: 0
      t.boolean :recruit, default: true

      t.timestamps null: false
    end
  end
end
