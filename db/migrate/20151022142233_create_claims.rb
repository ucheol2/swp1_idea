class CreateClaims < ActiveRecord::Migration
  def change
    create_table :claims do |t|
      t.string :content

      t.timestamps null: false
    end
  end
end
