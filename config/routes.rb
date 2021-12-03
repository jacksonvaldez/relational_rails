Rails.application.routes.draw do
  get '/', to: 'welcome#index'

  # Artist/Song Relationship
  get '/artists', to:'artists#index'
  get '/artists/new', to: 'artists#new'
  get '/artists/:id', to: 'artists#show'
  get '/artists/:id/edit', to: 'artists#edit'
  get '/songs', to:'songs#index'
  get '/songs/:id', to:'songs#show'
  get '/artists/:id/songs', to: 'songs#show_by_artist'
  get "/artists/:id/songs/new", to: 'songs#new'
  get "/songs/:id/edit", to: 'songs#edit'

  post '/artists/', to: 'artists#create'
  patch '/artists/:id', to:  'artists#update'
  post "/artists/:id/songs", to: 'songs#create'
  patch '/songs/:id', to:  'songs#update'

  # Bakery/Baker Relationship
  get '/bakeries', to:'bakeries#index'
  get '/bakeries/new', to: 'bakeries#new'
  get '/bakeries/:id', to:'bakeries#show'
  get '/bakeries/:id/edit', to: 'bakeries#edit'
  get '/bakers', to:'bakers#index'
  get '/bakers/:id', to:'bakers#show'
  get '/bakeries/:id/bakers', to:'bakers#show_by_bakery'
  get "/bakeries/:id/bakers/new", to: 'bakers#new'
  get "/bakers/:id/edit", to: 'bakers#edit'

  post '/bakeries/', to: 'bakeries#create'
  patch '/bakeries/:id', to: 'bakeries#update'
  post "/bakeries/:id/bakers", to: 'bakers#create'
  patch '/bakers/:id', to:  'bakers#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
