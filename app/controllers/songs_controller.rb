class SongsController < ApplicationController
  before_action :set_song!, only: [:show, :edit, :update, :destroy]


  def index
    @songs = Song.all
  end

  def new
    @song = Song.new
  end

  def create
    @song.create(song_params) ? ( redirect_to song_path(@song) ) : ( render :new )
  end

  def show
  end

  def edit
  end

  def update
    @song.update(song_params) ? ( redirect_to song_path(@song) ) : ( render :edit )
  end

  def destroy
    @song.destroy

    redirect_to songs_path
  end

  private

  def song_params(*args)
    params.require(:song).permit(*args)
  end

  def set_song!
    @song = Song.find(params[:id])
  end
end
