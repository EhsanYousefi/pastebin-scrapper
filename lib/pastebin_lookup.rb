module PastebinLookup

  class GetLinks

    def initialize(url="http://pastebin.com/archive")
      @url = url
    end

    def extract!

      agent = Mechanize.new
      page = agent.get(@url)

      page.search('.maintable tr td a').map do |link|
        Link.create(url: link['href'])
      end

    end

  end

  class Extractor

    def initialize(url)
      @url = 'http://pastebin.com' + url
    end

    def extract!

      agent = Mechanize.new
      page = agent.get(@url)
      body = page.body

      Pattern.get.each do |pattern|
        insert_to_database pattern, body.scan(Regexp.new(pattern))
      end

    end

    private

    def insert_to_database(pattern, array)
      unless array.empty?
        keyword = Keyword.create(
          pattern: pattern,
          word: array.first,
          url: @url,
          occur: array.count
        )
      end
    end

  end

end
