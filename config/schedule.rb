# run `rake feed:grab_daily` everyday one minute after midnight
every :day, :at => '12:01am' do
  rake "feed:grab_daily"
end
