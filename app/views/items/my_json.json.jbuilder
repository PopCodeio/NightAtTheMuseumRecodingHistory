json.timeline do items
  json.headline 'Revolutionary User Interfaces'
  json.startDate '1600'
  json.text 'test'
  json.type 'default'
  json.asset do
    json.media '/static/img/examples/user-interface/input.png'
    json.credit 'aLDO'
    json.caption 'ertwer'
  end
  json.date(items) do |item|
    json.headline item.title
    json.startDate item.time_line_date
    json.text item.description
    json.asset do
      json.media item.picture_url
      json.credit item.creator
      json.caption 'ertwer'
    end
  end
end
