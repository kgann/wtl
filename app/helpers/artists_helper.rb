module ArtistsHelper
  def render_portfolio(artist)
    yield if artist.images.length > 0
  end
end
