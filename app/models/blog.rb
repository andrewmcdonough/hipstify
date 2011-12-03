class Blog < ActiveRecord::Base

  has_many :reviews

  def scraper
    Class.const_get("#{short_name.classify}Scraper").new
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

  def self.scrape_all_lists
    Blog.all.each do |blog|
      blog.scrape_list
    end
  end

end
