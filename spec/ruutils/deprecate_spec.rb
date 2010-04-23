require 'spec_helper'

class Test
	include RUUtils::Deprecate

	deprecate
	def test

	end

	def test2

	end
end

describe RUUtils::Deprecate do
	it "should warn when a deprecated method is called" do
		test = Test.new
		test.should_receive(:warn)
		test.test
		test.should_not_receive(:warn)
		test.test2
	end
end
