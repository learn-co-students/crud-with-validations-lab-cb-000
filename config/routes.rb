Rails.application.routes.draw do

  resources :songs, :except => [:destroy]
  get '/', to: 'songs#index'
  delete '/songs/:id', to: 'songs#destroy'
end
