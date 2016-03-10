ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def assert_presence (model, field)
  	model.valid?
  	assert_match /can't be blank/, model.errors[field].join,
  		'Presence error for #{field} not found on #{model.class}'
  end

  def assert_no_digits (model, field)
  	valid = false if /([0-9])+/.match(model[field])
  	assert_not valid
  end
end
