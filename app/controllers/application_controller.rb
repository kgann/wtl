class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_artists

  def fetch_artists
    @artists = Artist.order(:first_name)
  end
end
