Rails.application.routes.draw do
    resources :albums
    root :to => redirect('/albums')
    #get '/search' => 'albums#search', :as => 'search_album'
    get '/similar_albums/:id', to: 'album#search', as: 'similar_albums'
    post '/albums/search_db'
end

