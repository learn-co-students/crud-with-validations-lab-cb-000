Rails.application.routes.draw do
  get 'songs/index'

  get 'songs/show'

  get 'songs/new'

  get 'songs/create'

  get 'songs/edit'

  get 'songs/delete'

  resources :songs, only: [:index, :show, :new, :create, :edit, :delete, :update, :destroy]
end
