module CompaniesHelper
  
  require "nokogiri"
  require "open-uri"
  
  def get_cmpn_news(word)
    
    url = URI.escape("https://news.google.com/gn/news/search/section/q/#{word}/#{word}/?hl=ja&gl=JP&ned=jp")
    
    charset = nil
    html = open(url) do |f|
      charset = f.charset
      f.read
    end
  
    doc = Nokogiri::HTML.parse(html, nil, charset)
  
    array = Array.new
    
  
    doc.xpath("//*[@class='PaqQNc']").each do |node|
  
      title = node.css(".nuEeue.hzdq5d.ME7ew").inner_text
      link = node.css(".nuEeue.hzdq5d.ME7ew").attribute("href").value


      begin
        img = node.css(".lmFAjc").attribute("src").value
      rescue
        img = ""
      end
      
      news_source = node.css(".IH8C7b.Pc0Wt").inner_text
      
      array << {title: title, link: link, img: img, news_source: news_source}
    end
    
    return array
    
  end
end
