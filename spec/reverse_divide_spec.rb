require "spec_helper"
require "reverse_divide"

describe ReverseDivide do

	it "should only accept a number for the limit" do
		@numbers = ReverseDivide.new("one_million").find_all_numbers
		@numbers.should == "The limit can only be an integer."
	end

end