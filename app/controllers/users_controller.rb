class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
  	@users = User.all
  
  end

  def show
  	@user = User.find(params[:id])
  end

  def send_page



  	flash[:notice] = "Page sent!"
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
