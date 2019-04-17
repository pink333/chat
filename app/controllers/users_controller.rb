class UsersController < ApplicationController
   before_action :authenticate_user!, only: [:edit, :update]
   before_action :correct_user,   only: [:edit, :update]
   
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    @user.update(params[:user].permit(:username, :userdes, :usertxt, :picture))
    redirect_to root_path
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.following
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end


private
 def correct_user
  @user = User.find(params[:id])
  redirect_to root_path unless @user == current_user
 end
end



