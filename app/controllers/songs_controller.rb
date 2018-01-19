class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @song = Song.find(params[:id])
  end


  def new
    @song = Song.new
  end

  def create
    if @song = Song.create(song_params(:title, :released, :release_year, :artist_name, :genre))
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def song_params(*args)
    params.require(:song).permit(*args)
  end
end
