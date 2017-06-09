# Load the Rails application.
require_relative 'application'

require 'carrierwave/orm/activerecord'

ActionMailer::Base.smtp_settings = {
  :user_name => ENV['username'],
  :password => ENV['password'],
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 587,
  :authentication => :plain,
  :enable_starttls_auto => true
}


# Initialize the Rails application.
Rails.application.initialize!
