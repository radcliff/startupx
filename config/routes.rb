Rails.application.routes.draw do
  scope '/api' do
    get '/foot-traffic', to: 'api/traffic#index'
  end
end
