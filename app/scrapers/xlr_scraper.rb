require 'ostruct'

class XlrScraper

  def scrape_list
    fh = open("http://www.xlr8r.com/reviews")
    doc = Nokogiri::XML(fh)
    list = []
    doc.css("h2.title").each do |e|
      href = e.children.first["href"]
      url = "http://www.xlr8r.com#{href}"
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
    review.content = doc.css(".post p").text rescue nil
    review.rating = doc.css(".post-details li").children[7].text.split("/").first.to_f rescue nil
    review.artist = doc.css("h1").children[1].text.strip rescue nil
    review.recording = doc.css("h1").children[2].text.strip rescue nil
    fh.close
    review
  end

end
