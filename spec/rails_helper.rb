# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?

include ApplicationHelper

require 'spec_helper'
require 'rspec/rails'
require 'shoulda/matchers'
require 'database_cleaner'
require 'capybara/rails'
require 'capybara/rspec'
require 'devise'
require 'capybara-screenshot/rspec'
require "rack_session_access/capybara"
require "email_spec"

Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.include ShowMeTheCookies, :type => :feature

  config.include(EmailSpec::Helpers)
  config.include(EmailSpec::Matchers)
end
