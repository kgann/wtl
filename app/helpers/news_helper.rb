module NewsHelper
  def format(date)
    date.split(",").map(&:strip).join("_")
  end
end
