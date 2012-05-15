module ApplicationHelper
  def active?(path)
    "active" if Rails.application.routes.recognize_path(path)[:controller] == controller.controller_name
  end

  def get_shop_info
    shop_info = ShopInfo.last
    html = <<-HTML
      <p>
        #{shop_info.address}<br />
        #{shop_info.city}, #{shop_info.state} #{shop_info.zip}<br />
        #{shop_info.phone_number}
      </p>
      <p>
        #{shop_info.hours.split("\n").join("<br />")}
      </p>
    HTML
  end

end
