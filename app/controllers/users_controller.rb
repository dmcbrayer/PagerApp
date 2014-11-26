class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :authenticate_user!

  def index
  	@users = User.all
  
  end

  def show
  	
  end

  def send_page

    @user = User.find(params[:user_id])
    @recipient = '+1' + @user.phone
    @name = @user.full_name

    #Twilio actions
    @client = Twilio::REST::Client.new

    @client.account.messages.create({
      :from => '+16785828610', 
      :to => @recipient, 
      :body => 'Hey there ' + @name,  
    })


  	flash[:notice] = "Page sent to #{@user.full_name}!"
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
