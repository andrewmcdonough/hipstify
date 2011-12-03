class CreateReviews < ActiveRecord::Migration
  def self.up
    create_table :reviews do |t|
      t.references :recording
      t.float :rating
      t.float :normalized_rating
      t.references :blog

      t.timestamps
    end
  end

  def self.down
    drop_table :reviews
  end
end
