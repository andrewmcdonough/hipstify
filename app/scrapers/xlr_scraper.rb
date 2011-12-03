require 'ostruct'

class XlrScraper

  def scrape_list
    fh = open("http://www.xlr8r.com/reviews")
    doc = Nokogiri::XML(fh)
    list = []
    doc.css("h2.title").each do |e|
      href = e.children.first["href"]
      url = "http://www.xlr8r.com/#{href}"
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
    doc = Nokogiri::XML(fh)
    review.content = doc.css(".editorial").first.text
    review.rating = doc.css(".mark .value").first.text.to_f
    review.artist = doc.css("h1.fn").children[0].text
    review.recording = doc.css("h1.fn").children[3].text
    fh.close
    review
  end

end
