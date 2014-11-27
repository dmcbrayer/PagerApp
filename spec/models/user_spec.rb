require 'rails_helper'

RSpec.describe User, :type => :model do
  
  before do
  	@user = FactoryGirl.create(:user)
  end

  subject {@user}

  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:phone)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:organizations)}

  it {should be_valid}

  describe "when email is blank" do
  	before {@user.email = " "}
  	it {should_not be_valid}
  end 

  describe "when password is blank" do
  	before {@user.password = " "}
  	it {should_not be_valid}
  end

  describe "when password_confirmation is blank" do
  	before {@user.password_confirmation=" "}
  	it {should_not be_valid}
  end

  describe "when password_confirmation doesn't match" do
  	before {@user.password_confirmation="mismatch"}
  	it {should_not be_valid}
  end

  describe "organization relationships" do
  	let(:organization) {FactoryGirl.create(:organization)}
  	before {@user.organizations << organization}

  	it "should have created a relationship" do
  		expect(@user.organizations).to include organization
  	end
  end

end
