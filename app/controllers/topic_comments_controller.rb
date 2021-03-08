class TopicCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]

  # exec / create comment
  def create
    @comment = TopicComment.new(comment_params)
    if @comment.save
      flash[:success] = "Success comment."
    end
    redirect_to request.referrer || root_url
  end

  # exec / destroy comment
  def destroy
    @comment = TopicComment.where(id: params[:id], topic_id: params[:topic_id]).first

    if !@comment
      flash[:danger] = "Comment is not exist."
    elsif !@comment.deletable? current_user
      flash[:danger] = "forbidden."
    else
      flash[:success] = "Success comment!"
      @comment.destroy
    end

    redirect_to request.referrer || root_url
  end

  private
  def comment_params
    params.require(:topic_comment).permit(:body).merge(user_id: current_user.id, topic_id: params[:topic_id], commented_at: Time.current)
  end
end
