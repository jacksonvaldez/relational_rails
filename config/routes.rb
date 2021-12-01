Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Artist/Song Relationship
  get '/artists', to:'artists#index'
  get '/artists/:id', to: 'artists#show'

  # Bakery/Baker Relationship
  get '/bakeries', to:'bakeries#index'
  get 'bakeries/:id', to:'bakeries#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
