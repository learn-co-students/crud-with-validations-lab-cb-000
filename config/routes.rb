Rails.application.routes.draw do
  resources :songs, only: [:index, :show, :edit, :update]
  delete 'songs/:id', to: 'songs#destroy', as: 'delete_song'
end
