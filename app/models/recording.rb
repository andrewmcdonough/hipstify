class Recording < ActiveRecord::Base
  belongs_to :artist
  delegate :name, :to => :artist, :prefix => true, :allow_nil => true

  def load_spotify_uri
    self.spotify_uri = lookup_spotify_uri
    save
  end

  def lookup_spotify_uri
    puts "Looking up #{artist.name} #{name}"
    begin
      MetaSpotify::Album.search("#{artist.name} #{name}").first[1][0].uri
    rescue
      puts "album not found"
    end
  end

  def self.load_unspotified
    Recording.where("spotify_uri IS NULL").each do |r|
      r.load_spotify_uri
    end
  end
end
