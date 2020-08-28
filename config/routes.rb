Rails.application.routes.draw do
  get '/songs', to: 'songs#index'
  post '/songs', to: 'songs#create'
  get '/songs/new', to: 'songs#new', as: 'new_song'
  get '/songs/:id/edit', to: 'songs#edit', as: 'edit_song'
  get '/songs/:id', to: 'songs#show', as: 'song'
  patch '/songs/:id', to: 'songs#update'
  put '/songs/:id', to: 'songs#update'
  delete '/songs/:id', to: 'songs#destroy'
  
  root 'songs#index'
end
