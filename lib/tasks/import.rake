require 'anemone'
require 'nokogiri'
require 'net/http'
require 'open-uri'
namespace :pull do
  desc 'test'
  task :images => :environment do
    target = 'http://historymiamiarchives.org/guides/?p=digitallibrary/digitalcontent&id=3'
    picture = 'http://historymiamiarchives.org/guides/index.php?p=digitallibrary/getfile&id=681&preview=long'
    File.open('sample.png', 'wb') do |fo|
      fo.write open(picture).read
    end

    doc = Nokogiri::HTML(open(target))
    title         = doc.css('div.digcontentdata')[0].content
    puts title
    date          = doc.css('div.digcontentdata')[1].content
    puts date
    description   = doc.css('div.digcontentdata')[2].content
    puts description
    id            = doc.css('div.digcontentdata')[3].content
    puts id
    source        = doc.css('div.digcontentdata')[4].content
    puts source
    found         = doc.css('div.digcontentdata')[5].content
    puts found
    creator       = doc.css('div.digcontentdata')[6].content
    puts creator
    subject       = doc.css('div.digcontentdata')[7].content
    puts subject
    rights        = doc.css('div.digcontentdata')[8].content
    puts rights

    #1..1000.times do |t|
      #url = target + '&id=' + t.to_s
      #doc = Nokogiri::HTML(open(url))
      #puts doc
      #puts page
    #end
  end
end
