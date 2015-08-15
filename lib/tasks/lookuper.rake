# require "#{Rails.root}/lib/pastebin_lookup.rb"
namespace :lookuper do
  task :lookup => :environment do
    puts "Lookuper started..."

    lookup = PastebinLookup::GetLinks.new

    loop do
      lookup.extract!
      sleep 10
    end

  end
end
