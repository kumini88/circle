module ToppagesHelper
  
  require "nokogiri"
  require "open-uri"
  
  def get_news(category)
    begin
      url = URI.escape("https://news.yahoo.co.jp/hl?c=#{category}")
    
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
    
      doc = Nokogiri::HTML.parse(html, nil, charset)
    
      array = Array.new
      
    
      doc.xpath("//*[@class='listBd']/li").each do |node|
    
        title = node.css(".ttl a").inner_text
        link = node.css(".ttl a").attribute("href").value

  
        begin
          img = node.css(".thumb a img").attribute("src").value
        rescue
          img = ""
        end
        
        news_source = node.css(".source .cp").inner_text
        date = node.css(".source").inner_text
        date.delete!(news_source)
        
        array << {title: title, link: link, img: img, news_source: news_source, date: date}
      end
      
    rescue
      return array
    end
  end
end