class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if @comment.save!
      redirect_to post_show_path(current_user.id)
    else
      flash.now[:alert] = 'Comment creation failed'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_show_path(current_user.id)
  end

  def comment_params
    params.require(:comment).permit(:post_id, :text)
  end
end
