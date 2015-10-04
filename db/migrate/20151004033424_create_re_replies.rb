class CreateReReplies < ActiveRecord::Migration
  def change
    create_table :re_replies do |t|
      
      t.integer :user_id
      t.integer :reply_id
      t.string :content

      t.timestamps null: false
    end
  end
end
