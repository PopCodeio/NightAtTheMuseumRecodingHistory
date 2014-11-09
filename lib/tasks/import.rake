require 'anemone'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'date'
namespace :pull do
  desc 'test'
  task :images => :environment do
    target = 'http://historymiamiarchives.org/guides/?p=digitallibrary/digitalcontent'
    picture = 'http://historymiamiarchives.org/guides/index.php?p=digitallibrary/getfile&preview=long'

    1..1000.times do |t|
      #num = t+1
      num = t+180

      File.open('public/pictures/' + num.to_s + '.jpg', 'wb') do |fo|
        fo.write open(picture + '&id=' + num.to_s).read
      end

      doc = Nokogiri::HTML(open(target +'&id='+ num.to_s))
      puts target  +'&id='+ num.to_s
      puts picture +'&id='+ num.to_s
      if doc.css('div.digcontentdata')[0]
        item = Item.find_or_initialize_by(id: num)
        item.source_db_id     = num
        item.title            = doc.css('div.digcontentdata')[0].content if doc.css('div.digcontentdata')[0]
        item.date             = doc.css('div.digcontentdata')[1].content if doc.css('div.digcontentdata')[1]
        item.description      = doc.css('div.digcontentdata')[2].content if doc.css('div.digcontentdata')[2]
        item.source_id        = doc.css('div.digcontentdata')[3].content if doc.css('div.digcontentdata')[3]
        item.source           = doc.css('div.digcontentdata')[4].content if doc.css('div.digcontentdata')[4]
        item.found            = doc.css('div.digcontentdata')[5].content if doc.css('div.digcontentdata')[5]
        item.creator          = doc.css('div.digcontentdata')[6].content if doc.css('div.digcontentdata')[6]
        item.subject          = doc.css('div.digcontentdata')[7].content if doc.css('div.digcontentdata')[7]
        item.rights           = doc.css('div.digcontentdata')[8].content if doc.css('div.digcontentdata')[8]
        begin
          item.time_line_date   = DateTime.parse(item.date)
          #puts item.time_line_date.to_s + ' YAY!!!!'
        rescue
          date = item.date.gsub(/\D/,'')
          if date.length  == 4
            date =  date + '-'+ (rand(11)+1).to_s + '-' + (rand(27)+1).to_s
            item.time_line_date   = DateTime.parse(date)
          elsif date == ''
            date = item.source_id.at(0..3)
            date =  date + '-'+ (rand(11)+1).to_s + '-' + (rand(27)+1).to_s
            item.time_line_date   = DateTime.parse(date)
          elsif date.length == 8
            mydate = date
            date = mydate.at(0..3) + '-' + mydate.at(6..7) + '-' + mydate.at(5..6)
            item.time_line_date   = DateTime.parse(date)
          else
            #debugger
          end
          #puts item.date.to_s + ' Cant convert to date'
        end
        image = 'public/pictures/' + num.to_s + '.jpg'
        photo = MiniExiftool.new image
        photo.title       = item[:title] || ''
        photo.description = item[:description] || ''
        photo.save

        #item.remote_picture_path = "#{Rails.root}/public/pictures/" + num.to_s + ".jpg"
        item[:picture]          = num.to_s + '.png'
        item[:params]           = doc.css('div.digcontentdata').to_json
        item.save
      end
    end
  end
end
