class Blog < ActiveRecord::Base

  has_many :reviews

  def scraper
    DrownedScraper.new
  end


  def scrape_list
    list = [
      {:url => "http://google.com", :title => "hello"},
      {:url => "http://google.com", :title => "hello2"}
    ]
    list = scraper.scrape_list
    list.each do |entry|
      title = entry[:title]
      review = self.reviews.find_by_title(title) || Review.new
      puts "saving title as #{title}"
      review.title = title
      review.url = entry[:url]
      review.save
    end
  end
end
