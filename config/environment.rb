# frozen_string_literal: true

# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Configure ActionMailer to use SendGrid
ActionMailer::Base.smtp_settings = {
  user_password: ENV['MAILER_USER_PASSWORD'],
  password: ENV['MAILER_PASSWORD'],
  domain: ENV['MAILER_DOMAIN'],
  address: ENV['MAILER_ADDRESS'],
  port: '587',
  authentication: :plain,
  enable_starttls_auto: true
}
