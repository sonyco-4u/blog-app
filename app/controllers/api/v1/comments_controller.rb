class Api::V1::CommentsController < Api::V1::ApplicationController
  def index
    comments = Post.find(params[:post_id]).comments
    render json: comments, status: :ok
  end

  def create
    comment = Comment.new(text: comment_params['text'],
                          author_id: params['user_id'],
                          post_id: params['post_id'])
    if comment.save
     render json: comment, status: :created
    else
     render json: { errors: comment.errors }, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
