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

  	flash[:notice] = "Page sent to #{@user.first_name}!"
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
