xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do

    xml.title "PasteBin"
    xml.description "PasteBin Scrapper"
    xml.link feed_url
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => feed_url

    for keyword in @keywords
      xml.item do
        xml.word keyword.word
        xml.url keyword.url
        xml.occurness keyword.occur
      end
    end

  end
end
