class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new(like_params)
    @like.author_id = current_user.id

    if @like.save
      redirect_to post_show_path(current_user.id)
    else
      flash.now[:alert] = 'Like creation failed'
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
