Rails.application.routes.draw do
  resources :songs

#  Helper  HTTP   Path
#  Prefix  Verb   URI Pattern               Controller#Action
# Path/Url
# songs    GET    /songs(.:format)          songs#index
#          POST   /songs(.:format)          songs#create
#new_song  GET    /songs/new(.:format)      songs#new
#edit_song GET    /songs/:id/edit(.:format) songs#edit
#  song    GET    /songs/:id(.:format)      songs#show
#          PATCH  /songs/:id(.:format)      songs#update
#          PUT    /songs/:id(.:format)      songs#update
#          DELETE /songs/:id(.:format)      songs#destroy
end
