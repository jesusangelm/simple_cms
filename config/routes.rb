Rails.application.routes.draw do

  match ":controller(/:action(/:id))", via: [ :get, :post ]

end
