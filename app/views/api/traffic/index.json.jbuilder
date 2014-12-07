json.traffic_count @whereabouts.count

json.traffic @whereabouts do |whereabout|
  
  json.user do
    json.uid whereabout.user.uid
  end

  json.datetime whereabout.datetime
  
  json.latlng do
    json.latitude whereabout.latlon.lat
    json.longitude whereabout.latlon.lon
  end

end
