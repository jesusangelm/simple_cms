Rails.application.routes.draw do

  get "admin", to: 'access#index'

  match ":controller(/:action(/:id))", via: [ :get, :post ]

end
