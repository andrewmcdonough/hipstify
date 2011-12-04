class AddPublisedAtToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :published_at, :datetime
  end

  def self.down
    remove_column :reviews, :published_at
  end
end
