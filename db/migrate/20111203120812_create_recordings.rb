class CreateRecordings < ActiveRecord::Migration
  def self.up
    create_table :recordings do |t|
      t.references :artist

      t.timestamps
    end
  end

  def self.down
    drop_table :recordings
  end
end
