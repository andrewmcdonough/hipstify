class Artist < ActiveRecord::Base
  has_many :recordings


  def load_spotify_uri
    begin
      self.spotify_uri = MetaSpotify::Artist.search(self.name).first[1][0].uri
      save
    rescue
      puts "Error finding URI"
    end
  end

  def self.load_unspotified
    Artist.where("spotify_uri IS NULL").each do |a|
      a.load_spotify_uri
    end
  end
end
