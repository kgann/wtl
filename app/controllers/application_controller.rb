class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :fetch_artists, :fetch_photo_loop_images, :fetch_categories, :fetch_news_dates

  def fetch_artists
    @artists = Artist.order(:first_name).where(:active => true)
  end

  def fetch_photo_loop_images
    if params[:controller] == "artists" && profile_image = Artist.find_by_url(params[:id]).profile_image
      @photo_loop_images = [profile_image]
    else
      @photo_loop_images = Image.where(:photo_loop => true).order('created_at DESC')
    end
  end

  def fetch_categories
    @categories = Category.order(:name)
  end

  def fetch_news_dates
    sql = "distinct date_part('month', created_at) AS month, date_part('year', created_at) AS year"
    @dates = Post.select(sql).order(:month, :year).limit(5).reduce([]) do |arr, date|
      arr << "#{Date::MONTHNAMES[date.month.to_i]}, #{date.year}"
    end << "Archive"
  end

end
