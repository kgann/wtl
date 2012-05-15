class ArtistsController < ApplicationController
  def index; end

  def show
    @artist = Artist.find_by_url(params[:id])
  end
end
