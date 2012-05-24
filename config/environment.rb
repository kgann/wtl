# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Wtl::Application.initialize!

Haml::Template.options[:format] = :xhtml

ActionMailer::Base.delivery_method = :sendmail
