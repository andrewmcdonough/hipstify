class DrownedScraper

  def scrape_list
    fh = open("http://drownedinsound.com/releases/reviewed")
    @doc = Nokogiri::XML(fh)
    list = []
    @doc.css("h4 a").each do |e|
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

end
