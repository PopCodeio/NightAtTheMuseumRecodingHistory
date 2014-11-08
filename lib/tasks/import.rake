require 'anemone'
require 'nokogiri'
require 'net/http'
require 'open-uri'
namespace :pull do
  desc 'test'
  task :images => :environment do
    target = 'http://historymiamiarchives.org/guides/?p=digitallibrary/digitalcontent'
    picture = 'http://historymiamiarchives.org/guides/index.php?p=digitallibrary/getfile&preview=long'

    1..10.times do |t|
      num = t+1
      File.open('public/pictures/' + num.to_s + '.png', 'wb') do |fo|
        puts picture + '&id=' + num.to_s
        fo.write open(picture + '&id=' + num.to_s).read
      end
      doc = Nokogiri::HTML(open(target +'&id='+ num.to_s))
      puts target +'&id='+ num.to_s
        debugger
      if doc.css('div.digcontentdata')[0]
        item = Item.find_or_initialize_by(source_db_id: num.to_s)
        item[:title]         = doc.css('div.digcontentdata')[0].content if doc.css('div.digcontentdata')[0]
        item[:date]          = doc.css('div.digcontentdata')[1].content if doc.css('div.digcontentdata')[1]
        item[:description]   = doc.css('div.digcontentdata')[2].content if doc.css('div.digcontentdata')[2]
        item[:source_db_id]  = doc.css('div.digcontentdata')[3].content if doc.css('div.digcontentdata')[3]
        item[:source]        = doc.css('div.digcontentdata')[4].content if doc.css('div.digcontentdata')[4]
        item[:found]         = doc.css('div.digcontentdata')[5].content if doc.css('div.digcontentdata')[5]
        item[:creator]       = doc.css('div.digcontentdata')[6].content if doc.css('div.digcontentdata')[6]
        item[:subject]       = doc.css('div.digcontentdata')[7].content if doc.css('div.digcontentdata')[7]
        item[:rights]        = doc.css('div.digcontentdata')[8].content if doc.css('div.digcontentdata')[8]
        item[:picture]       = t.to_s + '.png'
        item[:params]        =
        item.save
      end
    end
  end
end
