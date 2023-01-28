class PostsController < ApplicationController
  def index
    @posts = Post.all
    @user = User.find_by(id: params[:user_id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.most_recent_comments
  end
end
