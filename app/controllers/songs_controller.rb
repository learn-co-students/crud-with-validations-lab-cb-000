class SongsController < ApplicationController

  def index
    @songs = Song.all
  end


  def show
    @song = Song.find(params[:id])
  end

  def edit
    # binding.pry
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    @song.update(song_params)
    if @song.valid?
      @song.save
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def create
    # binding.pry
    @song = Song.new(song_params)

    if @song.save
      redirect_to song_path(@song)
    else
      render :new
    end
  end

  def destroy
  end

  def new
    @song = Song.new
  end

  private

  def song_params
    params.permit(:title, :release_year, :released, :artist_name, :genre)
  end
end
