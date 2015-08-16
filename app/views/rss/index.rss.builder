xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do

    xml.title "PasteBin"
    xml.description "PasteBin Scrapper"
    xml.link feed_url

    for keyword in @keywords
      xml.item do
        xml.title(keyword.word)
        xml.description(keyword.occur)
        xml.pubDate(keyword.created_at.to_s(:rfc822))
        xml.link('http://pastebin.com')
        xml.guid(keyword.url)
      end
    end

  end
end
