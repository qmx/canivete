require 'spec_helper'

describe Canivete::Deprecate do

	before(:each) do
		@test = Test.new
	end

	it "should warn when a deprecated method is called" do
		@test.should_receive(:warn)
		@test.test
	end

	it "should not warn when a ordinary method is called" do
		@test.should_not_receive(:warn)
		@test.test2
	end

end

# test class below
class Test
	include Canivete::Deprecate

	deprecate
	def test

	end

	def test2

	end
end
