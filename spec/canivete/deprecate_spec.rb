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

  it "should accept a :for parameter with a symbol and use it to warn in favor of which method of the current class the method was deprecated" do
    @test.should_receive(:warn) do |message|
      message.should include("Test#test")
    end
    @test.test3
  end

  it "should accept a :for parameter with a string and use it to warn in favor of what the method was deprecated" do
    @test.should_receive(:warn) do |message|
      message.should include(" Class#method")
    end
    @test.test4
  end

  it "should accept a :for parameter with a symbol and an :on parameter with a class and use them to warn in favor of which class and method the method was deprecated" do
    @test.should_receive(:warn) do |message|
      message.should include("Parent#test")
    end
    @test.test5
  end

  it "should call parent's method_added method" do
    $called_parent.should be_true
  end
end

class Parent
  def self.method_added(name)
    $called_parent = true
  end
end

# test class below
class Test < Parent
  include Canivete::Deprecate

  deprecate
  def test
  end

  def test2
  end

  deprecate :for => :test
  def test3
  end

  deprecate :for => "Class#method"
  def test4 
  end

  deprecate :for => :test, :on => Parent
  def test5
  end
end
