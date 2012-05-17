module ArtistsHelper
  def render_portfolio(artist)
    render(:partial => 'artists/portfolio') if artist.images.length > 0
  end
end
