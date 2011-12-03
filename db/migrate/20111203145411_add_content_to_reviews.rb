class AddContentToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :content, :text
  end

  def self.down
    remove_column :reviews, :content
  end
end
