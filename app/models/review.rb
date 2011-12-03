class Review < ActiveRecord::Base
  belongs_to :recording
  belongs_to :blog
  has_one :artist, :through => :recording

  before_save :normalize_rating, :link_recording

  attr_accessor :artist_name, :recording_name

  #delegate :name, :to => :recording, :prefix => true, :allow_nil => true
  #delegate :name, :to => :artist, :prefix => true, :allow_nil => true

  def scraper
    blog.scraper
  end

  def scrape
    r = scraper.scrape_review(self.url)
    self.content = r.content
    self.rating = r.rating
    self.artist_name = r.artist
    self.recording_name = r.recording
    save
  end

  def normalize_rating
    return unless blog.rating_out_of.present? && blog.rating_out_of > 1
    self.normalized_rating = (rating / blog.rating_out_of)
  rescue
    "hackday, whatever"
  end

  def hundred_rating
    return "N/A" if normalized_rating.nil?
    (normalized_rating * 100).floor
  end

  def link_recording
    artist = Artist.find_by_name(self.artist_name) || Artist.create!(:name => self.artist_name)
    self.recording = artist.recordings.where("name = ?", self.recording_name).try(:first) || artist.recordings.create!(:name => recording_name)
    self.recording.artist = artist
  end

  def as_json(options)
    {
      id: id,
      rating: hundred_rating,
      recording: recording.try(:name),
      artist: artist.try(:name),
      blog_title: blog.title,
      artist_spotify_uri: artist.try(:spotify_uri),
      recording_spotify_uri: recording.try(:spotify_uri),
    }
  end

  def self.scrape_all
    Review.all.each do |review|
      review.scrape
    end
  end
end
