class AddTitleToReviews < ActiveRecord::Migration
  def self.up
    add_column :reviews, :title, :string
  end

  def self.down
    remove_column :reviews, :title
  end
end
