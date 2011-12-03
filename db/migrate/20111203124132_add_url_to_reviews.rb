class AddUrlToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :url, :text
  end

  def self.down
    remove_column :reviews, :url
  end
end
