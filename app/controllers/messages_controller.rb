class MessagesController < ApplicationController

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

  def message_params
    params.require(:message).permit(:content, :user_id, :recipient)
  end

  def send_message(user_id, recipient, content)

    #set up the required variables for the Twilio message
  	@recipient_user = User.find(recipient)
    @recipient_number = '+1' + @recipient_user.phone
    @recipient_name = @recipient_user.full_name

    @sending_user = User.find(user_id)
    @sending_number = @sending_user.phone
    @sending_name = @sending_user.full_name

    @content = content + " Call back number:  #{@sending_number}.  Sent from #{@sending_name} via the Pager App."


    #Twilio actions
    @client = Twilio::REST::Client.new

    @client.account.messages.create({
      :from => '+16785828610', 
      :to => @recipient_number, 
      :body => @content
    })

    #confirmation feedback kind of stuff
    flash[:notice] = "Page sent to #{@recipient_user.full_name}!"
    puts "=================="
    puts "=   Page Sent!   ="
    puts "=================="

    redirect_to controller: 'users'
  end
end
