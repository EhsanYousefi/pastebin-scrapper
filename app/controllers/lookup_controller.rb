require "whenever"

class LookupController < ApplicationController
  def index

    lookup = PastebinLookup.new

    loop do
      lookup.extract!
      sleep 1
    end

  end
end
