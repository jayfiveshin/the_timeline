class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :type
      t.string :location
      t.datetime :start_date_time
      t.datetime :end_date_time
      t.boolean :all_day
      t.integer :price
      t.boolean :free

      t.timestamps
    end
    add_index :events, :name
  end

  def self.down
    drop_table :events
  end
end
