module ApplicationHelper
  def active?(path)
    "active" if Rails.application.routes.recognize_path(path)[:controller] == controller.controller_name
  end

  def get_shop_info
    return "" unless shop_info = ShopInfo.last
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

  def render_blob(blob, tag=:p)
    blob.gsub(/\r\n+/, "\n").split("\n").reject{ |t| t.empty? }.map do |paragraph| 
      content_tag(tag, paragraph)
    end.join("\n").html_safe
  end

  def render_bio(bio)
    return unless bio
    "<h4>Background</h4>".html_safe << render_blob(bio)
  end

end
