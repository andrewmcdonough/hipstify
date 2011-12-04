require 'ostruct'
require 'open-uri'

class ResidentScraper

  def scrape_list
    url = "http://www.residentadvisor.net/reviews.aspx?format=album"
    fh = open(url)
    doc = Nokogiri::HTML(fh)
    list = []
    doc.css("a.music").each do |e|
      url = "http://www.residentadvisor.net#{e["href"]}"
      title = e.text
      list << {
        :url => url,
        :title => title
      }
    end
    fh.close
    list
  end


  def scrape_review(url)
    review = OpenStruct.new
    fh = open(url)
    doc = Nokogiri::HTML(fh)
    title = doc.css("h1[@itemprop='itemreviewed']").text
    (artist,recording) = title.split(" - ")
    review.content = doc.css(".lineheight").text
    review.rating = doc.css("img[@itemprop='rating']").first.attributes["alt"].value.to_f rescue nil
    review.artist = artist
    review.recording = recording
    fh.close
    review
  rescue
    "whatever, it's a hack"
  end

end
