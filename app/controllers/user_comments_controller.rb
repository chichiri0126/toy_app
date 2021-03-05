class UserCommentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :delete]

  # exec / create comment
  def create
    @comment = UserComment.new(comment_params.merge(commented_at: Time.current))
    if @comment.save
      flash[:success] = "Success comment."
    end
    redirect_to request.referrer || root_url
  end

  # exec / delete comment
  def delete
    @comment = UserComment.where(user_id: params[:user_id], id: params[:comment_id]).first
    @thread = UserThread.find(@comment.user_thread_id)

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
    params.require(:user_comment).permit(:body).merge(user_id: current_user.id, user_thread_id: params[:user_thread_id])
  end
end
