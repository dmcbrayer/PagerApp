class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
  	@users = User.all
  
  end

  def show
  	@organizations = @user.organizations
  end

  def send_page

    @recipient_user = User.find(params[:user_id])
    @recipient_number = '+1' + @recipient_user.phone
    @recipient_name = @recipient_user.full_name

    @sending_number = current_user.phone
    @sending_name = current_user.full_name


    #Twilio actions
    @client = Twilio::REST::Client.new

    @client.account.messages.create({
      :from => '+16785828610', 
      :to => @recipient_number, 
      :body => "Message from #{@sending_name}:  Hey there #{@recipient_name}!  Call me back at #{@sending_number}."
    })

    #confirmation feedback kind of stuff
  	flash[:notice] = "Page sent to #{@recipient_user.full_name}!"
  	puts "=================="
    puts "=   Page Sent!   ="
    puts "=================="

    redirect_to action: 'index'
  end


private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end


end
