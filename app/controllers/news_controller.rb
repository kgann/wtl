class NewsController < ApplicationController
  def index; end

  def show
    month, year = params[:id].split("_")
    month = Date::ABBR_MONTHNAMES.index(month)
    @posts = Post.where("MONTH(created_at) = '#{month}' AND YEAR(created_at) = '#{year}'").order("created_at desc")
  end

  def archive
    sql = "distinct MONTH(created_at) AS month, YEAR(created_at) AS year"
    @archive_dates = Post.select(sql).order(:month, :year).reduce([]) do |arr, date|
      arr << "#{Date::MONTHNAMES[date.month.to_i]}, #{date.year}"
    end
  end

end
