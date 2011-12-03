class AddNameToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :name, :string
  end

  def self.down
    remove_column :recordings, :name
  end
end
