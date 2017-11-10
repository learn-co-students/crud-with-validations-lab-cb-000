class SongsController < ApplicationController
require 'pry'

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end


  def create

    @song = Song.new(song_params)
    # binding.pry
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find(params[:id])

  end

  def update
    @song = Song.find(params[:id])
    @song.update_attributes(song_params)
    if @song.save
        redirect_to song_path(@song)
      else
        render :edit
      end
  end

  def destroy
    Song.find(params[:id]).destroy
    redirect_to songs_path
  end

  def song_params
    params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
