atom_feed :language => 'en-US' do |feed|
  feed.title "PasteBinScrapper"
  feed.updated @keywods.first.created_at

  @keywords.each do |item|

    feed.entry( item ) do |entry|
      entry.url item.url
      entry.title item.word
      entry.content item.occur, :type => 'html'

      # the strftime is needed to work with Google Reader.
      entry.updated(item.created_at.strftime("%Y-%m-%dT%H:%M:%SZ"))

      entry.author do |author|
        author.name "PasteBin"
      end

    end
  end
end
