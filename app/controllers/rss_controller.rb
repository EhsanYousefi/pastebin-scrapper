class RssController < ApplicationController

  def index

    @keywords = Keyword.order("created_at DESC").limit(10000)

    render json: @keywords

  end

end
