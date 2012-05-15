module ApplicationHelper
  def active?(path)
    "active" if Rails.application.routes.recognize_path(path)[:controller] == controller.controller_name
  end
end
