require 'rails_helper'

RSpec.describe Organization, :type => :model do
	
	before do
		@organization = FactoryGirl.create(:organization)
	end

	subject {@organization}

	it {should respond_to(:name)}
	it {should respond_to(:variety)}
	it {should respond_to(:users)}

	it {should be_valid}

	describe "when name is blank" do
		before {@organization.name = " "}
		it {should_not be_valid}
	end

	describe "when variety is blank" do
		before {@organization.variety = " "}
		it {should_not be_valid}
	end

	describe "user relationships" do
	  	let(:user) {FactoryGirl.create(:user)}
	  	before {@organization.users << user}

	  	it "should have created a relationship" do
	  		expect(@organization.users).to include user
	  	end
	  end



end
