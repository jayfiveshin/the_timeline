class AddOccurrenceToEvents < ActiveRecord::Migration
  def self.up
    add_column :events, :occurrence_type, :string
  end

  def self.down
    remove_column :events, :occurrence_type
  end
end
