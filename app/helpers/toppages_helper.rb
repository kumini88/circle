module ToppagesHelper
  
  require "nokogiri"
  require "open-uri"
  
  def get_news(word)
    
      url = URI.escape("https://www.sankeibiz.jp/business/lists/#{word}-n.htm")
    
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
    
      doc = Nokogiri::HTML.parse(html, nil, charset)
    
      array = Array.new
      
    
      doc.xpath("//*[@id='NewsList']//ul").each do |node|
  
        title = node.css("a").inner_text
        link = "https://www.sankeibiz.jp/" +node.css("a").attribute("href").value
        
        source = "SankeiBiz"
        
        begin
          img = node.css(".lmFAjc").attribute("src").value
        rescue
          img = ""
        end
        
        array << {title: title, link: link, img: img, source: source}
      end
      
      return array
    
  end
  
  

  def get_cnsl_news
    
      url = URI.escape("https://www.consulnews.jp/post-archive/")
    
      charset = nil
      html = open(url) do |f|
        charset = f.charset
        f.read
      end
    
      doc = Nokogiri::HTML.parse(html, nil, charset)
    
      array = Array.new
      
    
      doc.xpath("//*[@class='article']").each do |node|
  
        title = node.css("h3").inner_text
        link = node.css("a").attribute("href").value
        
        source = "コンサル業界ニュース"
        
        begin
          img = node.css(".wp-post-image").attribute("src").value
        rescue
          img = ""
        end
        
        array << {title: title, link: link, img: img, source: source}
      end
      
      return array
    
    end
  
end



