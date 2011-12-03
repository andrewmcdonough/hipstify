class Blog < ActiveRecord::Base

  has_many :reviews

  def scraper
    DrownedScraper.new
  end


  def scrape_list
    list = scraper.scrape_list
    list.each do |entry|
      title = entry[:title]
      review = self.reviews.find_by_title(title) || self.reviews.build
      review.title = title
      review.url = entry[:url]
      review.save
    end
  end

end
