class RenameColumnInEvents < ActiveRecord::Migration
  def self.up
    rename_column(:events, :type, :occur_type)
  end

  def self.down
    rename_column(:events, :occur_type, :type)
  end
end
