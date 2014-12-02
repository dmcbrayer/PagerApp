class MessagesController < ApplicationController
  
  #before_action :set_user, only: [:new, :create]

  def new
  end

  #think through here about how you want to set this up if you're using a popover form to submit.  how are params getting passed through?  have a hidden field that contains the sending user's id and phone number.  Then have the form explicitly contain the message text.  Then the controller should append some text as well.  Form should also have limited characters.  Should have JS and AJAX validations that show up in the popover.

  def create
    @user = current_user
  	@message = @user.messages.build(message_params)

    if @message.save
      send_message(@message.user_id, @message.recipient, @message.content)
    else
      flash[:notice] = "Message could not be completed."
      redirect_to controller: 'users' 

    end
  end

  private

  def set_user
  	@user = User.find(params[:id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient)
  end

  def send_message(user_id, recipient, content)

  	@recipient_user = User.find(recipient)
    @recipient_number = '+1' + @recipient_user.phone
    @recipient_name = @recipient_user.full_name

    @sending_user = User.find(user_id)
    @sending_number = @sending_user.phone
    @sending_name = @sending_user.full_name


    #Twilio actions
    @client = Twilio::REST::Client.new

    @client.account.messages.create({
      :from => '+16785828610', 
      :to => @recipient_number, 
      :body => content
    })

    #confirmation feedback kind of stuff
    flash[:notice] = "Page sent to #{@recipient_user.full_name}!"
    puts "=================="
    puts "=   Page Sent!   ="
    puts "=================="

    redirect_to controller: 'users'
  end
end
