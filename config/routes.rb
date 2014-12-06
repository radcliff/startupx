Rails.application.routes.draw do
  scope '/api', defaults: {format: 'json'} do
    get '/foot-traffic', to: 'api/traffic#index'
  end
end
