require 'anemone'
require 'nokogiri'
require 'net/http'
require 'open-uri'
require 'date'
namespace :pull do
  desc 'test'
  task :images => :environment do
    base = 'http://historymiamiarchives.org/guides/'
    target = '?p=digitallibrary/digitalcontent'

    1..1000.times do |t|
      num = t+1
      #num = t+124

      doc = Nokogiri::HTML(open(base + target +'&id='+ num.to_s))
      puts base + target  +'&id='+ num.to_s

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
            date = mydate.at(0..3) + '-' + mydate.at(6..7) + '-' + mydate.at(4..5)
            item.time_line_date   = DateTime.parse(date)
          else
            if item.source_id.at(0..3).gsub(/\D/,'').length == 4
              date = item.source_id.at(0..3)
              date =  date + '-'+ (rand(11)+1).to_s + '-' + (rand(27)+1).to_s
              item.time_line_date   = DateTime.parse(date)
            end
            #debugger
          end
          #puts item.date.to_s + ' Cant convert to date'
        end

        if doc.at_css('img.digcontentfile')
          #image_id = doc.at_css('img.digcontentfile')['src'].split('&')[1].split('=').last
          #File.open('public/pictures/' + image_id + '.jpg', 'wb') do |fo|
            picture = base + doc.at_css('img.digcontentfile')['src']
           #fo.write open(picture).read

           #image = 'public/pictures/' + image_id + '.jpg'
           #photo = MiniExiftool.new image
           #photo.title       = item[:title] || ''
           #photo.description = item[:description] || ''
           #photo.save
          #end
        end

        #item.remote_picture_url = picture + '&id=' + num.to_s
        #item.remote_picture_url = "http://127.0.0.1:3000/pictures/" + num.to_s + ".jpg"
        # item.remote_picture_path = "#{Rails.root}/public/pictures/" + num.to_s + ".jpg"
        #item[:picture]          = num.to_s + '.jpg'
        item[:params]           = doc.css('div.digcontentdata').to_json
        unless item.save
          item.errors.each do |e|
            puts e
          end
        else
          #src = File.join(Rails.root, "/public/pictures/" + image_id + ".jpg")
          #src_file = File.new(src)
          #item.picture = src_file
          item.remote_picture_url = picture
          if item.save
            puts 'Image ' + item.id.to_s +  ' Saves'
          else
            puts 'Sorry Image ' + item.id.to_s +  ' did not Saves :('
          end
        end
      end
    end
  end
end
