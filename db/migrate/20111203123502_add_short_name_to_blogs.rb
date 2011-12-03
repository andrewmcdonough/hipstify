class AddShortNameToBlogs < ActiveRecord::Migration
  def self.up
    add_column :blogs, :short_name, :string
  end

  def self.down
    remove_column :blogs, :short_name
  end
end
