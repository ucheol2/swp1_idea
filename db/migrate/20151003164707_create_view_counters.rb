class CreateViewCounters < ActiveRecord::Migration
  def change
    create_table :view_counters do |t|
      t.integer :idea_id
      t.string :ip_address

      t.timestamps null: false
    end
  end
end
