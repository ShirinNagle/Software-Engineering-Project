Rails.application.routes.draw do
    resources :albums
    root :to => redirect('/albums')
end

