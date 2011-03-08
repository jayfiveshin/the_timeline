class DeleteEvents < ActiveRecord::Migration
  def self.up
    drop_table :events
  end

  def self.down
    create_table :events do |t|
      t.string :name
      t.string :type
    end
  end
end
