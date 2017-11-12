ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

# These are files with reusable code for tests.
Dir[Rails.root.join("test/shared/**/*")].each { |file| require file }

class ActiveSupport::TestCase
  # Add more helper methods to be used by all tests here...
end
