class AddSpotifyUriUriToRecordings < ActiveRecord::Migration
  def self.up
    add_column :recordings, :spotify_uri, :string
  end

  def self.down
    remove_column :recordings, :spotify_uri
  end
end
