class Link < ActiveRecord::Base

  validates :url, presence: true, uniqueness: true
  after_save :keyword

  private

  def keyword
    # Delegete Responsibility To Extractor Class
    ::PastebinLookup::Extractor.new(url).extract!
  end

end
