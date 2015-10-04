class CreateIdeaUsers < ActiveRecord::Migration
  def change
    create_table :idea_users do |t|
      t.integer :idea_id
      t.integer :user_id
      t.boolean :favorite
      t.boolean :owned
      t.boolean :like

      t.timestamps null: false
    end
  end
end
