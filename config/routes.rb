Rails.application.routes.draw do
  namespace :api, defaults: {format: :json } do
    namespace :v1 do 
      resources :contacts, except: [:new, :edit]
      # get "/contacts", to: "contacts#index" 
      # post "/contact", to: "contact#create" 
      # get "/contact/:id", to: "contact#show" 
      # put "/contact/:id", to: "contact#update" 
      # delete "/contact/:id", to: "contact#destroy" 
    end
  end
end
