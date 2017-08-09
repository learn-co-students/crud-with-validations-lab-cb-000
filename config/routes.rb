Rails.application.routes.draw do
  resources :songs, only: [:index, :create, :new, :destroy, :edit, :show, :update]
end
