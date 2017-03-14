class SongsController < ApplicationController

  def index
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
  end

  private
    def song_params
      params.require(:songs).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
