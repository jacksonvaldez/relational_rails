Rails.application.routes.draw do
  get '/', to: 'welcome#index'
  get '/artists', to:'artists#index'
  get '/artists/:id', to: 'artists#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end