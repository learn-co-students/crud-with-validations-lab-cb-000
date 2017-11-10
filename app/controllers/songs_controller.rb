class SongsController < ApplicationController
require 'pry'

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find_by(params[:id])
  end

  def new
    @song = Song.new
  end


  def create

    @song = Song.new(song_params)
    binding.pry
    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def edit
    @song = Song.find_by(params[:id])

  end

  def update
  end

  def song_params
    params.permit(:title, :released, :release_year, :artist_name, :genre)
  end
end
