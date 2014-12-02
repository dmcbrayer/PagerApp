require 'rails_helper'

RSpec.describe Message, :type => :model do
    before do
    	@user = FactoryGirl.create(:user)
		@message = {content: "HEY THERE PEOPLE", recipient: 5}
		@usermessage = @user.messages.build(@message)
	end

	subject {@usermessage}

	it {should respond_to(:user)}
	it {should respond_to(:content)}
	it {should respond_to(:recipient)}

	it {should be_valid}

end
