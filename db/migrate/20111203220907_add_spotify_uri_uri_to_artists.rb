class AddSpotifyUriUriToArtists < ActiveRecord::Migration
  def self.up
    add_column :artists, :spotify_uri, :string
  end

  def self.down
    remove_column :artists, :spotify_uri
  end
end
