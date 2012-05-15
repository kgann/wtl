class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_artists, :fetch_photo_loop_images

  def fetch_artists
    @artists = Artist.order(:first_name)
  end

  def fetch_photo_loop_images
    @photo_loop_images = Image.where(:photo_loop => true).order('created_at DESC')
  end

end
