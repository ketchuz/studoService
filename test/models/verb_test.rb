require 'test_helper'

class VerbTest < ActiveSupport::TestCase

	def setup
		@v = verbs(:haben)
	end

  test 'attribute not empty and a string' do
    @v.german  = '3'
    assert_no_digits(@v, :german)
  end

  test 'invalid german gives error message' do
  	@v.german = nil
  	assert_presence(@v, :german)
  end

  test 'invalid english gives error message' do
  	@v.english = nil
  	assert_presence(@v, :english)
  end

  test 'invalid spanish gives error message' do
  	@v.spanish = nil
  	assert_presence(@v, :spanish)
  end
end
