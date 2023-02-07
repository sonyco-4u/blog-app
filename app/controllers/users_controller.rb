class UsersController < ApplicationController
  def index
    @users = User.all
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.most_recent_posts
  end
end
