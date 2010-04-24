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

  it "should accept a :for parameter and used it to warn in favor of which method the first was deprecated" do
    @test.should_receive(:warn) do |message|
      message.should include("Test#test")
    end
    @test.test3
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

  deprecate :for => :test
  def test3
  end
end
