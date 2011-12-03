require 'ostruct'

class DrownedScraper

  def scrape_list
    fh = open("http://drownedinsound.com/releases/reviewed")
    doc = Nokogiri::XML(fh)
    list = []
    doc.css("h4 a").each do |e|
      url = "http://drownedinsound.com#{e["href"]}"
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
