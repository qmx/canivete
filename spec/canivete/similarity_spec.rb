require 'spec_helper'

describe Canivete::Similarity do
	before(:each) do
		class String
			include Canivete::Similarity
		end
	end
	it "should rate equal strings with 1.0" do
		"".similarity_rate("").should == 1.0
		"joao".similarity_rate("joao").should == 1.0
	end
	it "should not break with empty strings" do
		"".similarity_rate("joao").should == 0.0
		"joao".similarity_rate("").should == 0.0
	end
	it "should ignore case" do
		"JoAO".similarity_rate("joao").should == 1.0
	end
	it "should not ignore case when told so" do
		"JoAO".similarity_rate("joao", :ignore_case => false).should < 1.0
	end
	it "should cope with different-sized strings" do
		"JoAO".similarity_rate("paralelogram of n sides").should == 0.0
	end
end