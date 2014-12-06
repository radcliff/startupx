namespace :feed do
  task :grab_daily do
    # get rgeo factory for spatial column
    factory = Whereabout.rgeo_factory_for_column('latlon')

    # grab foot traffic data from API
    response = RestClient.get "https://api.fivesquare.com/v1/foot-traffic", {params: {date: today}}
    
    # parse results
    whereabouts_collection = JSON.parse(response)

    # iterate through user location history
    whereabouts_collection.each do |about|
      user_id = about.user_id
      location_history = about.location_history

      # find user in db by uid (table indexed on column)
      user = User.find_by(uid: user_id)

      # perform all inserts in single transaction
      ActiveRecord::Base.transaction do
        
        # for each item in 'location_history'
        location_history.each do |where|
          
          # create rgeo geometry object (longitude first) for each location
          location = factory.point(where.location[1], where.location[0])
          
          # create new user-whereabout 
          user.Whereabouts.create(datetime: where.datetime, latlon: location)
        end
      end
    end

  end
end