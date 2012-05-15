class NewsController < ApplicationController
  def index; end

  def show
    month, year = params[:id].split("_")
    month = Date::ABBR_MONTHNAMES.index(month)
    @posts = Post.where("date_part('month', created_at) = '#{month}' AND date_part('year', created_at) = '#{year}'").order("created_at desc")
  end

  def archive
    sql = "distinct date_part('month', created_at) AS month, date_part('year', created_at) AS year"
    @archive_dates = Post.select(sql).order(:month, :year).reduce([]) do |arr, date|
      arr << "#{Date::MONTHNAMES[date.month.to_i]}, #{date.year}"
    end
  end

end
