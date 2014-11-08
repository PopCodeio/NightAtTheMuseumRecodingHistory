require 'anemone'
require 'nokogiri'
require 'net/http'
namespace :pull do
  desc 'test'
  task :images => :environment do
    target = 'http://historymiamiarchives.org/guides/?p=digitallibrary/digitalcontent&id=3'
    Anemone.crawl(target) do |anemone|
      anemone.on_every_page do |page|
        res = read_http(page.url) if page.url.instance_of?(URI::HTTP)
        if res.code.to_i == 200
          doc = Nokogiri::HTML(res.body)
          puts "#{page.url} (depth: #{page.depth}, forms:#{doc.search("//form").count}) "
        end
        puts page
      end
    end
  end
end
