class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update]
  # songs    GET    /songs(.:format)          songs#index
  #          POST   /songs(.:format)          songs#create
  #new_song  GET    /songs/new(.:format)      songs#new
  #edit_song GET    /songs/:id/edit(.:format) songs#edit
  #  song    GET    /songs/:id(.:format)      songs#show
  #          PATCH  /songs/:id(.:format)      songs#update
  #          PUT    /songs/:id(.:format)      songs#update
  #          DELETE /songs/:id(.:format)      songs#destroy

  def index
    @songs = Song.all
  end

  def show
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @song.update(song_params)
    if @song.valid?
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist_name, :released, :release_year)
  end

  def set_song!
    @song = Song.find(params[:id])
  end

end
