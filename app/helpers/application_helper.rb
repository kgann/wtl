module ApplicationHelper
  def active?(path)
    "active" if Rails.application.routes.recognize_path(path)[:controller] == controller.controller_name
  end

  def get_shop_info
    return "" unless shop_info = ShopInfo.last
    <<-HTML
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
      p_with_links = paragraph.gsub(/\((.+)\)\[(.+)\]/, external_link_to('\\1', '\\2')).html_safe
      content_tag(tag, p_with_links)
    end.join("\n").html_safe
  end

  def render_bio(bio)
    return unless bio
    "<h4>Background</h4>".html_safe << render_blob(bio)
  end

  def external_link_to(text, url, classes=[])
    url = url.strip.gsub(/http:\/\/|^/, "http://")
    link_to(text, url, :target => "_blank", :class => classes.join(" "))
  end
end
