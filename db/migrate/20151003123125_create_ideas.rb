class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      
      t.integer :user_id
      t.string :name
      t.string :password
      t.string :summary
      t.text :description

      t.timestamps null: false
    end
  end
end
