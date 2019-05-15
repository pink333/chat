class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post].permit(:user_id, :post_id, :belo, :content))
    @post.user_id = current_user.id
    unless @post.save
      flash[:danger] = "文字を入力してください"
    end
  
    redirect_to user_path(@user)
  end
  
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.all

  end

  def show
    #@user = User.find(params[:user_id])
    @post = Post.find(params[:id])
    #@post = @user.posts.find(params[:id])
    @like = Like.new
  end

  def edit
  end

  def update
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.update(params[:post].permit(:user_id, :post_id, :belo, :content))
    redirect_to root_path
  end

  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @post.destroy
    flash[:success] = "削除しました"
    redirect_to user_path(@user)
  end
  end
