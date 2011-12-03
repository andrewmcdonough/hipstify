class Review < ActiveRecord::Base
  belongs_to :recording
  belongs_to :blog

  before_save :normalize_rating

  def scraper
    blog.scraper
  end

  def scrape
    r = scraper.scrape_review(self.url)
    self.content = r.content
    self.rating = r.rating
    save
  end

  def normalize_rating
    return unless blog.rating_out_of.present? && blog.rating_out_of > 0
    self.normalized_rating = (rating / blog.rating_out_of)
  end

  def hundred_rating
    return "N/A" if normalized_rating.nil?
    (normalized_rating * 100).floor
  end

end
