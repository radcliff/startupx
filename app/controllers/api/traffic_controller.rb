class Api::TrafficController < ApplicationController
  before_filter :set_factory  

  # GET /api/foot-traffic
  def index
    if params[:center] and params[:radius]
      # remove spaces, if present, and split into array
      coordinates = params[:center].gsub(/\s+/,'').split(/,/)
      # convert to float
      radius = params[:radius].to_f

      # create rgeo geometry object
      center_point = @factory.point(coordinates[1], coordinates[0])

      @whereabouts = Whereabout.find_by_sql(["SELECT * FROM whereabouts WHERE ST_DWithin(latlon, ?, ?);", center_point, radius])
    else
      render plain: "invalid request"
    end
  end

private
  def set_factory
    # get rgeo factory for spatial column
    @factory = Whereabout.rgeo_factory_for_column('latlon')
  end

end
