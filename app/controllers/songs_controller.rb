class SongsController < ApplicationController

  def index
    @songs = Song.all
  end


  def edit

    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
  end

  def new
    @song = Song.new
  end

  def song_params
    params.permit(:title, :artist_name, :released, :release_year, :genre)
  end


end
