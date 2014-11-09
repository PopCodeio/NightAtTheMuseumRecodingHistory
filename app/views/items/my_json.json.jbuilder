json.timeline do items
  json.headline "Chronicle's of Miami's History"
  json.startDate ''
  json.text 'Built by Moises Zaragoza, Chris Scott and Aldo Delagdo'
  json.type 'default'
  json.asset do
    json.media 'assets/team.jpg'
    json.credit 'History Miami Hackathon'
    json.caption ''
  end
  json.date(items) do |item|
    json.headline '<a href="http://www.google.com">'+item.title+'</a>'
    json.startDate item.time_line_date.strftime("%D")
    json.text item.description
    json.asset do
      json.media item.picture_url
      json.credit item.creator
      json.caption item.rights
      json.thumbnail item.picture_url
    end
  end
end
