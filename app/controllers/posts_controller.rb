class PostsController < ApplicationController
  before_action :authenticate_user!

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.create(params[:post].permit(:user_id, :post_id, :belo, :content))
    unless @post.save
      flash[:danger] = "文字を入力してください"
    end

    redirect_to user_path(@user)

  end

  def edit
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
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
