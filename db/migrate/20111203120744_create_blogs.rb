class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string :title
      t.string :url
      t.float :rating_out_of
      t.string :image_file_name
      t.string :image_content_type
      t.file_size :image

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
